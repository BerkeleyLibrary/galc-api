require 'rails_helper'

describe AvailabilityService do
  let(:mms_ids) { %w[991005668359706532 991005668209706532] }

  describe 'multiple IDs' do
    before do
      sru_query_value = mms_ids
        .map { |id| BerkeleyLibrary::Alma::RecordId.parse(id) }
        .map(&:sru_query_value)
        .join(' or ')
      sru_query_uri = BerkeleyLibrary::Alma::SRU.sru_query_uri(sru_query_value)
      stub_request(:get, sru_query_uri).to_return(body: File.read('spec/data/alma/availability-sru.xml'))
    end

    it 'gets the availability' do
      availability = AvailabilityService.availability_for(mms_ids)
      expect(availability.size).to eq(mms_ids.size)
      expect(availability[mms_ids.first]).to eq(false)
      expect(availability[mms_ids.last]).to eq(true)
    end

    it 'ignores nil IDs' do
      mms_ids_with_nils = [nil, mms_ids.first, nil, mms_ids.last, nil]
      availability = AvailabilityService.availability_for(mms_ids_with_nils)
      expect(availability.size).to eq(mms_ids.size)
      expect(availability[mms_ids.first]).to eq(false)
      expect(availability[mms_ids.last]).to eq(true)
    end

    it 'ignores garbage IDs' do
      mms_ids_with_garbage = ['garbage', mms_ids.first, 'trash', mms_ids.last, 'refuse']
      availability = AvailabilityService.availability_for(mms_ids_with_garbage)
      expect(availability.size).to eq(mms_ids.size)
      expect(availability[mms_ids.first]).to eq(false)
      expect(availability[mms_ids.last]).to eq(true)
    end
  end

  describe 'single ID' do
    let(:mms_id) { '991005668359706532' }

    before do
      sru_query_uri = BerkeleyLibrary::Alma::RecordId.parse(mms_id).marc_uri
      stub_request(:get, sru_query_uri).to_return(body: File.read("spec/data/alma/availability-sru-#{mms_id}.xml"))
    end

    it 'can handle a single ID' do
      availability = AvailabilityService.availability_for(mms_id)
      expect(availability.size).to eq(1)
      expect(availability[mms_id]).to eq(false)
    end
  end

  describe 'argument handling' do
    it 'returns an empty hash for an empty array' do
      mms_ids = []
      expect(AvailabilityService.availability_for(mms_ids)).to eq({})
    end

    it 'returns an empty hash for a nil array' do
      mms_ids = nil
      expect(AvailabilityService.availability_for(mms_ids)).to eq({})
    end

    it 'returns an empty hash for an array of nils' do
      mms_ids = [nil]
      expect(AvailabilityService.availability_for(mms_ids)).to eq({})
    end

    it 'returns an empty hash for garbage inputs' do
      mms_ids = ['not an MMS ID', 'also not an MMS ID']
      expect(AvailabilityService.availability_for(mms_ids)).to eq({})
    end
  end

  describe 'error handling' do
    let(:sru_query_uri) do
      sru_query_value = mms_ids
        .map { |id| BerkeleyLibrary::Alma::RecordId.parse(id) }
        .map(&:sru_query_value)
        .join(' or ')
      BerkeleyLibrary::Alma::SRU.sru_query_uri(sru_query_value)
    end

    it 'handles HTTP errors' do
      stub_request(:get, sru_query_uri).to_return(status: 404)

      expect(Rails.logger).to receive(:warn)

      availability = AvailabilityService.availability_for(mms_ids)
      expect(availability).to eq({})
    end

    it 'handles garbage responses' do
      stub_request(:get, sru_query_uri).to_return(body: 'I am not an XML document')

      expect(Rails.logger).to receive(:warn)

      availability = AvailabilityService.availability_for(mms_ids)
      expect(availability).to eq({})
    end
  end

end
