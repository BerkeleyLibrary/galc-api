# noinspection RubyLiteralArrayInspection
class PopulateFacets < ActiveRecord::Migration[7.0]

  FACETS = {
    'Colors' => ['Color', 'Black and White'],
    'Size' => ['Small', 'Medium', 'Large', 'Oversized'],
    'Decade' =>
      [
        'Before 1900',
        '1900-1909',
        '1910-1919',
        '1920-1929',
        '1930-1939',
        '1940-1949',
        '1950-1959',
        '1960-1969',
        '1970-1979',
        '1980-1989',
        '1990-1999',
        'After 1999',
        'No Date'
      ],
    'Genre' =>
      [
        'Abstract', 'Animals', 'Cityscape', 'Figurative', 'Landscape', 'Pop Art', 'Religious', 'Still Life', 'Text Based'
      ],
    'Medium' =>
      [
        'Aquatint',
        'Collage',
        'Collagraph',
        'Drypoint',
        'Engraving',
        'Etching',
        'Giclée',
        'Intaglio',
        'Linocut',
        'Lithograph',
        'Mezzotint',
        'Mixed Media',
        'Monoprint',
        'Monotype',
        'Painting',
        'Photograph',
        'Photolithograph',
        'Photoprint',
        'Planographic',
        'Relief',
        'Relief Etching',
        'Serigraph',
        'Silkscreen',
        'Stencil',
        'Unidentified',
        'Wood Engraving',
        'Woodcut',
        'Zincograph'
      ] }

  HIERARCHICAL_TERMS_BY_FACET = {
    'Medium' => {
      'Intaglio' => [
        'Aquatint',
        'Drypoint',
        'Engraving',
        'Etching',
        'Mezzotint',
        'Photoprint',
        'Relief Etching'
      ],
      'Planographic' => [
        'Lithograph',
        'Photolithograph',
        'Zincograph'
      ],
      'Relief' => [
        'Collagraph',
        'Linocut',
        'Wood Engraving',
        'Woodcut'
      ],
      'Stencil' => [
        'Serigraph',
        'Silkscreen'
      ]
    }
  }

  def up
    FACETS.each do |f, tt|
      facet = Facet.create(name: f)
      tt.each { |t| Term.create(facet: facet, value: t) }
    end

    HIERARCHICAL_TERMS_BY_FACET.each do |f, terms_tree|
      facet = Facet.find_by!(name: f)
      terms_tree.each do |v_parent, v_children|
        raise ArgumentError, "Missing term for #{facet.name} : #{v_parent}" unless (t_parent = Term.find_by(facet: facet, value: v_parent))
        t_parent.children = v_children.map { |v_child| Term.find_by!(facet: facet, value: v_child) }
      end
    end
  end

  def down
    Term.destroy_all
    Facet.destroy_all
  end
end

