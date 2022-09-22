require 'rails_helper'

describe FacetSerializer do
  before do
    # creating the terms creates the facets by side effect
    create_all(Term)
  end

  it 'serializes a facet' do
    facet = create(:facet)
    expected_hash = {
      data: {
        id: facet.id.to_s,
        type: :facet,
        attributes: { name: facet.name },
        relationships: {
          terms: {
            data: facet.terms.map { |t| { id: t.id.to_s, type: :term } }
          }
        }
      }
    }

    serializer = FacetSerializer.new(facet)
    actual_hash = serializer.serializable_hash
    expect(actual_hash).to deep_eq_hash(expected_hash)
  end

  it 'sorts included terms by value' do
    facet = create(:facet_medium)
    serializer = FacetSerializer.new(facet, { include: [:terms] })
    actual_hash = serializer.serializable_hash

    expected_includes = facet.terms.order(:value).map { |t| TermSerializer.new(t).serializable_hash[:data] }
    actual_includes = actual_hash[:included]
    expect(actual_includes.size).to eq(expected_includes.size)
    expected_includes.each_with_index do |incl, i|
      expect(actual_includes[i]).to deep_eq_hash(incl)
    end
  end

  it 'sorts included terms by ord if present' do
    facet = create(:facet_decade)

    serializer = FacetSerializer.new(facet, { include: [:terms] })
    actual_hash = serializer.serializable_hash
    expected_includes = facet.terms.order(:ord, :value).map { |t| TermSerializer.new(t).serializable_hash[:data] }
    actual_includes = actual_hash[:included]
    expect(actual_includes.size).to eq(expected_includes.size)
    expected_includes.each_with_index do |incl, i|
      expect(actual_includes[i]).to deep_eq_hash(incl)
    end
  end
end
