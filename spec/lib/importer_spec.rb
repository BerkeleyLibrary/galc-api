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
    end

    # TODO: break this up, test facets etc.
    it 'returns the items' do
      mms_ids = data.scan(/9910\d{10}6532/)

      items = importer.items
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
        expect(it2.terms).to eq(it.terms)
      end
    end
  end
end
