require 'rails_helper'

describe AvailabilityService do
  let(:mms_ids) { %w[991005668359706532 991005668209706532] }

  before do
    sru_query_value = mms_ids.map { |id| BerkeleyLibrary::Alma::RecordId.parse(id) }.map(&:sru_query_value).join(' or ')
    sru_query_uri = BerkeleyLibrary::Alma::SRU.sru_query_uri(sru_query_value)
    stub_request(:get, sru_query_uri).to_return(body: File.read('spec/data/alma/availability-sru.xml'))
  end

  it 'gets the availability' do
    availability = AvailabilityService.availability_for(*mms_ids)
    expect(availability.size).to eq(mms_ids.size)
    expect(availability[mms_ids.first]).to eq(false)
    expect(availability[mms_ids.last]).to eq(true)
  end
end
