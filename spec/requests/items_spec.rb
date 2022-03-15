require 'rails_helper'

RSpec.describe 'Items', type: :request do
  before do
    # misusing an internal API, but what can you do?
    # https://github.com/thoughtbot/factory_bot/issues/1534
    FactoryBot.factories.each { |f| create(f.name) if f.build_class == Item }
  end

  describe 'reading' do
    describe :index do
      it 'returns the items' do
        expect(Item).to exist # just to be sure

        get items_url

        expect(response).to be_successful
        expect(response.content_type).to start_with('application/vnd.api+json')

        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to be_a(Hash)

        data = parsed_response['data']
        expected_json = Item.all.map { |i| jsonapi_for(i) }
        expect(data).to match_array(expected_json)
      end
    end

    describe :show do
      it 'returns an item' do
        item = Item.take
        get item_url(item)

        expect(response).to be_successful
        expect(response.content_type).to start_with('application/vnd.api+json')

        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to be_a(Hash)

        result = parsed_response['data']
        expect(result).to be_a(Hash)

        expect(result).to be_jsonapi_for(item)
      end
    end
  end

  describe 'writing' do
    let(:valid_attributes) do
      {
        image: 'viera da silva (composition).jpg',
        image_base: 'viera da silva (composition)',
        title: 'Composition (Le Gardin)',
        artist: 'Vieira da Silva, Maria Elena',
        artist_url: 'https://en.wikipedia.org/wiki/Maria_Helena_Vieira_da_Silva',
        date: '1959',
        decade: '1950-1959',
        description: 'Annotated "Epreuve d\'artiste."',
        medium: 'Serigraph',
        colors: 'Color',
        genre: 'Still Life',
        dimensions: '19 x 15"',
        size: 'Small',
        series: 'Artist\'s Proof',
        bib_number: 'b16398237',
        mms_id: '991051333089706532',
        barcode: 'c093329284',
        circulation: 'NON-CIRC',
        location: 'Stored in box',
        value: '800',
        appraisal_date: '2006',
        notes: '17741786',
        reserve_date: '2019-09-16'
      }
    end

    describe :create do
      xit 'creates an item'
      xit 'requires a title'
      xit 'accepts a nil MMS ID'
      xit 'requires a unique MMS ID'
    end
  end
end
