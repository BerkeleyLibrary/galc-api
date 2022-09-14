FactoryBot.define do
  factory :term do
    value { 'Empiricism' }

    association :facet

    to_create do |instance|
      instance.id = Term.find_or_create_by(
        facet: instance.facet,
        value: instance.value,
        parent: instance.parent
      ).id
      instance.reload
    end

    factory(:term_color) do
      value { 'Color' }
      facet { association :facet_appearance }
    end

    factory(:term_black_and_white) do
      value { 'Black and White' }
      facet { association :facet_appearance }
    end

    factory(:term_small) do
      value { 'Small' }
      facet { association :facet_size }
    end

    factory(:term_medium) do
      value { 'Medium' }
      facet { association :facet_size }
    end

    factory(:term_large) do
      value { 'Large' }
      facet { association :facet_size }
    end

    factory(:term_oversized) do
      value { 'Oversized' }
      facet { association :facet_size }
    end

    factory(:term_before_1900) do
      value { 'Before 1900' }
      facet { association :facet_decade }
    end

    factory(:term_1900_1909) do
      value { '1900-1909' }
      facet { association :facet_decade }
    end

    factory(:term_1910_1919) do
      value { '1910-1919' }
      facet { association :facet_decade }
    end

    factory(:term_1920_1929) do
      value { '1920-1929' }
      facet { association :facet_decade }
    end

    factory(:term_1930_1939) do
      value { '1930-1939' }
      facet { association :facet_decade }
    end

    factory(:term_1940_1949) do
      value { '1940-1949' }
      facet { association :facet_decade }
    end

    factory(:term_1950_1959) do
      value { '1950-1959' }
      facet { association :facet_decade }
    end

    factory(:term_1960_1969) do
      value { '1960-1969' }
      facet { association :facet_decade }
    end

    factory(:term_1970_1979) do
      value { '1970-1979' }
      facet { association :facet_decade }
    end

    factory(:term_1980_1989) do
      value { '1980-1989' }
      facet { association :facet_decade }
    end

    factory(:term_1990_1999) do
      value { '1990-1999' }
      facet { association :facet_decade }
    end

    factory(:term_after_1999) do
      value { 'After 1999' }
      facet { association :facet_decade }
    end

    factory(:term_no_date) do
      value { 'No Date' }
      facet { association :facet_decade }
    end

    factory(:term_abstract) do
      value { 'Abstract' }
      facet { association :facet_genre }
    end

    factory(:term_animals) do
      value { 'Animals' }
      facet { association :facet_genre }
    end

    factory(:term_cityscape) do
      value { 'Cityscape' }
      facet { association :facet_genre }
    end

    factory(:term_figurative) do
      value { 'Figurative' }
      facet { association :facet_genre }
    end

    factory(:term_landscape) do
      value { 'Landscape' }
      facet { association :facet_genre }
    end

    factory(:term_pop_art) do
      value { 'Pop Art' }
      facet { association :facet_genre }
    end

    factory(:term_religious) do
      value { 'Religious' }
      facet { association :facet_genre }
    end

    factory(:term_still_life) do
      value { 'Still Life' }
      facet { association :facet_genre }
    end

    factory(:term_text_based) do
      value { 'Text Based' }
      facet { association :facet_genre }
    end

    factory(:term_collage) do
      value { 'Collage' }
      facet { association :facet_medium }
    end

    factory(:term_giclée) do
      value { 'Giclée' }
      facet { association :facet_medium }
    end

    factory(:term_intaglio) do
      value { 'Intaglio' }
      facet { association :facet_medium }
    end

    factory(:term_mixed_media) do
      value { 'Mixed Media' }
      facet { association :facet_medium }
    end

    factory(:term_monoprint) do
      value { 'Monoprint' }
      facet { association :facet_medium }
    end

    factory(:term_monotype) do
      value { 'Monotype' }
      facet { association :facet_medium }
    end

    factory(:term_painting) do
      value { 'Painting' }
      facet { association :facet_medium }
    end

    factory(:term_photograph) do
      value { 'Photograph' }
      facet { association :facet_medium }
    end

    factory(:term_planographic) do
      value { 'Planographic' }
      facet { association :facet_medium }
    end

    factory(:term_relief) do
      value { 'Relief' }
      facet { association :facet_medium }
    end

    factory(:term_stencil) do
      value { 'Stencil' }
      facet { association :facet_medium }
    end

    factory(:term_unidentified) do
      value { 'Unidentified' }
      facet { association :facet_medium }
    end

    factory(:term_aquatint) do
      value { 'Aquatint' }
      facet { association :facet_medium }
      parent { association :term_intaglio }
    end

    factory(:term_drypoint) do
      value { 'Drypoint' }
      facet { association :facet_medium }
      parent { association :term_intaglio }
    end

    factory(:term_engraving) do
      value { 'Engraving' }
      facet { association :facet_medium }
      parent { association :term_intaglio }
    end

    factory(:term_etching) do
      value { 'Etching' }
      facet { association :facet_medium }
      parent { association :term_intaglio }
    end

    factory(:term_mezzotint) do
      value { 'Mezzotint' }
      facet { association :facet_medium }
      parent { association :term_intaglio }
    end

    factory(:term_photoprint) do
      value { 'Photoprint' }
      facet { association :facet_medium }
      parent { association :term_intaglio }
    end

    factory(:term_relief_etching) do
      value { 'Relief Etching' }
      facet { association :facet_medium }
      parent { association :term_intaglio }
    end

    factory(:term_lithograph) do
      value { 'Lithograph' }
      facet { association :facet_medium }
      parent { association :term_planographic }
    end

    factory(:term_photolithograph) do
      value { 'Photolithograph' }
      facet { association :facet_medium }
      parent { association :term_planographic }
    end

    factory(:term_zincograph) do
      value { 'Zincograph' }
      facet { association :facet_medium }
      parent { association :term_planographic }
    end

    factory(:term_collagraph) do
      value { 'Collagraph' }
      facet { association :facet_medium }
      parent { association :term_relief }
    end

    factory(:term_linocut) do
      value { 'Linocut' }
      facet { association :facet_medium }
      parent { association :term_relief }
    end

    factory(:term_wood_engraving) do
      value { 'Wood Engraving' }
      facet { association :facet_medium }
      parent { association :term_relief }
    end

    factory(:term_woodcut) do
      value { 'Woodcut' }
      facet { association :facet_medium }
      parent { association :term_relief }
    end

    factory(:term_serigraph) do
      value { 'Serigraph' }
      facet { association :facet_medium }
      parent { association :term_stencil }
    end

    factory(:term_silkscreen) do
      value { 'Silkscreen' }
      facet { association :facet_medium }
      parent { association :term_stencil }
    end

    factory(:term_risograph) do
      value { 'Risograph' }
      facet { association :facet_medium }
    end
  end
end
