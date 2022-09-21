require 'rails_helper'

describe TermSerializer do
  before do
    create_all(Term)
  end

  it 'serializes a term' do
    term = create(:term)
    expected_hash = {
      data: {
        id: term.id.to_s,
        type: :term,
        attributes: { value: term.value, ord: term.ord },
        relationships: {
          facet: {
            data: { id: term.facet.id.to_s, type: :facet }
          }
        }
      }
    }

    serializer = TermSerializer.new(term)
    actual_hash = serializer.serializable_hash

    expect(actual_hash).to deep_eq_hash(expected_hash)
  end

  it 'includes the parent if present' do
    term = create(:term_silkscreen)
    serializer = TermSerializer.new(term)
    actual_hash = serializer.serializable_hash

    expected_parent_hash = { data: { id: term.parent.id.to_s, type: :term } }
    actual_parent_hash = actual_hash[:data][:relationships][:parent]
    expect(actual_parent_hash).to deep_eq_hash(expected_parent_hash)
  end

  it 'includes the children if present' do
    term = create(:term_stencil)
    serializer = TermSerializer.new(term)
    actual_hash = serializer.serializable_hash

    expected_children_hash = { data: term.children.map { |t| { id: t.id.to_s, type: :term } } }
    actual_children_hash = actual_hash[:data][:relationships][:children]
    expect(actual_children_hash).to deep_eq_hash(expected_children_hash)
  end

  it 'can deep-include children' do
    term = create(:term_stencil)
    serializer = TermSerializer.new(term, { include: [:children] })
    actual_hash = serializer.serializable_hash

    expected_includes = term.children.map { |t| TermSerializer.new(t).serializable_hash[:data] }
    actual_includes = actual_hash[:included]
    expect(actual_includes.size).to eq(expected_includes.size)
    expected_includes.each_with_index do |incl, i|
      expect(actual_includes[i]).to deep_eq_hash(incl)
    end
  end
end
