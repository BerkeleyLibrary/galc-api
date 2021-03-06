require 'rails_helper'

describe AvailabilityService do
  let(:mms_ids) { %w[991005668359706532 991005668209706532] }

  def query_value_for(ids)
    ids
      .sort
      .map { |id| BerkeleyLibrary::Alma::RecordId.parse(id) }
      .map(&:sru_query_value)
      .join(' or ')
  end

  after do
    AvailabilityService.max_records = nil
    AvailabilityService.send(:clear_cache!)
  end

  describe 'multiple IDs' do
    before do
      sru_query_value = query_value_for(mms_ids)
      sru_query_uri = BerkeleyLibrary::Alma::SRU.sru_query_uri(sru_query_value, max_records: mms_ids.size)
      @stub = stub_request(:get, sru_query_uri).to_return(body: File.read('spec/data/alma/availability-sru.xml'))

      expect(Rails.logger).not_to receive(:warn)
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

    describe 'caching' do
      it 'caches results' do
        availability1 = AvailabilityService.availability_for(mms_ids)
        availability2 = AvailabilityService.availability_for(mms_ids)
        expect(availability2).to eq(availability1)
        expect(@stub).to have_been_requested.times(1)
      end

      it 'caches partial results' do
        availability1 = AvailabilityService.availability_for(mms_ids)

        addl_ids = %w[991007853589706532 991008364649706532]
        expected_query_uri = BerkeleyLibrary::Alma::SRU.sru_query_uri(query_value_for(addl_ids), max_records: addl_ids.size)
        stub_request(:get, expected_query_uri).to_return(body: File.read('spec/data/alma/availability-sru-addl.xml'))

        availability2 = AvailabilityService.availability_for(mms_ids + addl_ids)
        expect(availability2).to include(availability1)
        expect(availability2).to include(addl_ids.to_h { |id| [id, true] })
      end
    end

    describe :available? do
      it 'returns the availability for an item' do
        # Prepopulate the cache w/o having to stub separate requests
        AvailabilityService.availability_for(mms_ids)

        items = mms_ids.map do |mms_id|
          instance_double(Item).tap do |item|
            allow(item).to receive(:mms_id).and_return(mms_id)
          end
        end

        expect(AvailabilityService.available?(items.first)).to eq(false)
        expect(AvailabilityService.available?(items.last)).to eq(true)
      end
    end
  end

  describe 'with pagination' do
    let(:mms_ids) do
      %w[
        991005668209706532
        991005668359706532
        991005930379706532
        991005931249706532
        991007853589706532
        991007902439706532
        991007903029706532
        991008363529706532
        991008364649706532
        991008401919706532
        991008402049706532
        991008718379706532
        991008719659706532
        991008719819706532
        991009071149706532
      ]
    end

    let(:sru_query_value) { query_value_for(mms_ids) }

    let(:query_uri_page_1) { BerkeleyLibrary::Alma::SRU.sru_query_uri(sru_query_value) }

    let(:query_uri_page_2) { BerkeleyLibrary::Util::URIs.append(query_uri_page_1, '&startRecord=11') }

    before do
      stub_request(:get, query_uri_page_1).to_return(body: File.read('spec/data/alma/availability-sru-page-1.xml'))
      stub_request(:get, query_uri_page_2).to_return(body: File.read('spec/data/alma/availability-sru-page-2.xml'))
    end

    it 'retrieves availability for all IDs' do
      AvailabilityService.max_records = 10
      availability = AvailabilityService.availability_for(mms_ids)
      expect(availability.size).to eq(mms_ids.size)
      expect(availability.keys).to contain_exactly(*mms_ids)
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
      sru_query_value = query_value_for(mms_ids)
      BerkeleyLibrary::Alma::SRU.sru_query_uri(sru_query_value, max_records: mms_ids.size)
    end

    it 'logs a warning if availability info is missing' do
      mms_id = '991005668209706532'
      response_body = File
        .read('spec/data/alma/availability-sru.xml')
        .sub(%r{tag="AVA">(\s *<subfield code="0">#{mms_id}</subfield>)}m, 'tag="999">\1')
      stub_request(:get, sru_query_uri).to_return(body: response_body)

      expected_msg = "MARC record with 001 #{mms_id.inspect} does not have an AVA$e"
      expected_record = MARC::XMLReader.read(StringIO.new(response_body)).to_a.last

      expect(Rails.logger).to receive(:warn).with(expected_msg, record: expected_record.to_hash)

      availability = AvailabilityService.availability_for(mms_ids)
      expect(availability).to eq(mms_ids.to_h { |id| [id, false] })
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
