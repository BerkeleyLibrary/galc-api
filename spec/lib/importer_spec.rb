require 'rails_helper'

describe Importer do
  let(:data) { File.read('spec/data/importer/galc-metadata.csv') }

  attr_reader :importer

  before do
    # creating the terms creates the facets by side effect
    create_all(Term)
  end

  describe :items do
    before do
      @importer = Importer.new(data)

      img_re = /^#{Regexp.quote(Item.image_base_uri.to_s)}.*\.jpg$/
      stub_request(:head, img_re).to_return(status: 200)
    end

    # TODO: check images & thumbnails exist

    # TODO: break this up, test facets etc.
    it 'returns the items' do
      mms_ids = data.scan(/9910\d{10}6532/)

      items = importer.import_items!
      expect(items.size).to eq(mms_ids.size)

      items.each_with_index do |it, i|
        expect(it.mms_id).to eq(mms_ids[i])
        expect(it.persisted?).to eq(true)

        # check for CSV quoting issues
        attrs = Importer::ATTR_TO_HEADER.keys
        attrs.each do |attr|
          next if attr == :series || (attr_val = it.send(attr)).nil?

          expect(attr_val).not_to start_with('"')
        end

        # check that terms are saved
        expect(it.terms).not_to be_empty
        it2 = Item.find(it.id)
        expect(it2.terms).to contain_exactly(*it.terms)
      end
    end

    it 'sets attributes and facets' do
      importer.import_items!

      expected_attributes = {
        mms_id: '991056573939706532',
        barcode: 'C104988270',
        image: 'Ross(Farm).jpg',
        title: 'Farm [Slovene Farm]',
        artist: 'Ross, John',
        artist_url: 'http://oldprintshop.com/artists/46940',
        date: '1965',
        description: 'Signed, numbered, and titled.',
        dimensions: '31.5 x 35”',
        series: '"10/75"',
        circulation: nil,
        location: nil,
        value: nil,
        appraisal_date: nil,
        notes: nil,
        suppressed: false
      }

      expected_facet_values = {
        'Genre' => ['Animals', 'Still Life'],
        'Medium' => ['Collagraph'],
        'Appearance' => ['Color'],
        'Size' => ['Large'],
        'Decade' => ['1960-1969']
      }
      expected_terms = expected_facet_values.each_with_object([]) do |(fn, vv), tt|
        facet = Facet.find_by(name: fn)
        vv.each { |v| tt << Term.find_by(facet: facet, value: v) }
      end

      item = Item.find_by!(mms_id: '991056573939706532')
      expected_attributes.each do |attr, val|
        expect(item.send(attr)).to eq(val)
      end

      expect(item.terms.to_a).to contain_exactly(*expected_terms)
    end
  end

  describe 'validation' do
    attr_reader :image_uri, :thumbnail_uri

    before do
      vdata = data.lines(chomp: true)[0, 2].join("\n")

      image = vdata.scan(/(?<=,)[^,]+\.jpg(?=,)/)[0]
      thumbnail = image.sub(/\.jpg$/, '_360px.jpg')

      @image_uri, @thumbnail_uri = [image, thumbnail].map { |basename| Item.image_uri_for(basename) }

      @importer = Importer.new(vdata)
    end

    it 'fails if the image is not on the image server' do
      stub_request(:head, image_uri).to_return(status: 404)
      stub_request(:head, thumbnail_uri).to_return(status: 200)

      count_before = Item.count
      expect { importer.import_items! }.to raise_error(ArgumentError)
      expect(Item.count).to eq(count_before)
    end

    it 'fails if the thumbnail is not on the image server' do
      stub_request(:head, image_uri).to_return(status: 200)
      stub_request(:head, thumbnail_uri).to_return(status: 404)

      count_before = Item.count
      expect { importer.import_items! }.to raise_error(ArgumentError)
      expect(Item.count).to eq(count_before)
    end
  end
end
