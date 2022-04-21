require 'rails_helper'

describe Term do
  it 'must have a value' do
    term = create(:term)
    expect(term).to be_a(Term)
    expect(term).to be_valid # just to be sure

    term.value = nil
    expect(term).not_to be_valid
  end

  describe :facet do
    it 'has a facet' do
      term = create(:term)
      expect(term.facet).to be_a(Facet)
    end

    it 'must have a facet' do
      term = create(:term)
      term.facet = nil
      expect(term).not_to be_valid
    end
  end

  describe :parent do
    it 'need not have a parent' do
      term = create(:term)
      expect(term.parent).to be_nil
    end

    it 'can have a parent' do
      parent_term = create(:term)
      child_term = create(:term, value: 'Positivism', parent: parent_term)
      expect(child_term.parent).to eq(parent_term)
      expect(parent_term.children).to include(child_term)
    end

    it 'cannot have a parent in a different facet' do
      term = create(:term)
      other_facet = create(:facet, name: "Not #{term.facet.name}")
      other_term = create(:term, value: "Not #{term.value}", facet: other_facet)
      term.parent = other_term
      expect(term).not_to be_valid
    end
  end

  describe :children do
    before do
      FactoryBot.factories.select { |f| f.build_class == Term }.each { |f| create(f.name) }
    end

    it 'can have children' do
      facet_medium = Facet.find_by!(name: 'Medium')
      term_intaglio = Term.find_by!(value: 'Intaglio', facet: facet_medium)

      children = term_intaglio.children
      expected_values = [
        'Aquatint',
        'Drypoint',
        'Engraving',
        'Etching',
        'Mezzotint',
        'Photoprint',
        'Relief Etching'
      ]
      expect(children.pluck(:value)).to contain_exactly(*expected_values)
      children.each do |child|
        expect(child.parent).to eq(term_intaglio)
        expect(child.facet).to eq(facet_medium)
      end
    end
  end
end
