require 'rails_helper'

describe Facet do
  describe :name do

    it 'must have a name' do
      facet = create(:facet)
      expect(facet).to be_a(Facet)
      expect(facet).to be_valid # just to be sure

      facet.name = nil
      expect(facet).not_to be_valid
    end

    it 'must have a unique name' do
      facet = create(:facet)
      other_facet = Facet.new(name: facet.name)
      expect(other_facet).not_to be_valid
    end

  end
end
