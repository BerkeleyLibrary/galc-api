FactoryBot.define do
  factory :item, aliases: [:item_minami] do
    image { 'Minami(Tree).jpg' }
    image_base { 'Minami(Tree)' }
    title { 'Arbre (Tree)' }
    artist { 'Minami, Keiko' }
    artist_url { 'https://en.wikipedia.org/wiki/Keiko_Minami' }
    date { '1955' }
    decade { '1950-1959' }
    description { 'Signed and numbered.' }
    medium { 'Aquatint, Etching' }
    colors { 'Color' }
    genre { 'Landscape' }
    dimensions { '19 x 20"' }
    size { 'Medium' }
    series { '"16/50"' }
    bib_number { 'b16389322' }
    mms_id { '991051069589706532' }
    barcode { 'C091134068' }
    circulation { 'NON-CIRC' }
    location { 'Stored in box' }
    value { '500' }
    appraisal_date { '2006' }
    notes { '17358704' }
    reserve_date { '2019-09-10' }

    factory :item_reyes, aliases: %i[nil_circulation nil_location nil_notes] do
      image { 'Reyes (Eastern Sierras Color).jpg' }
      image_base { 'Reyes (Eastern Sierras Color)' }
      title { 'Eastern Sierras (Color)' }
      artist { 'Reyes, Fernando' }
      artist_url { 'http://www.freyesart.com/about/' }
      date { '2000' }
      decade { 'After 1999' }
      description { 'Signed and numbered.' }
      medium { 'Woodcut' }
      colors { 'Color' }
      genre { 'Landscape' }
      dimensions { '15.5 x 17.5"' }
      size { 'Small' }
      series { '"13/20"' }
      bib_number { 'b18365330' }
      mms_id { '991078545009706532' }
      barcode { 'C094893488' }
      circulation { nil }
      location { nil }
      value { '500' }
      appraisal_date { '2006' }
      notes { nil }
      reserve_date { '2019-08-28' }
    end

    factory :item_moore, aliases: %i[nil_bib_number nil_mms_id nil_reserve_date] do
      image { 'Moore(SeatedFigures).jpg' }
      image_base { 'Moore(SeatedFigures)' }
      title { 'Figures on a Green Background (Personnages sur fond vert)' }
      artist { 'Moore, Henry' }
      artist_url { 'https://en.wikipedia.org/wiki/Henry_Moore' }
      date { '1957' }
      decade { '1950-1959' }
      description { 'Signed and numbered. Severe lightstaining, Cramer 37, published by Berggruen & Cie and printed by Mourlot.' }
      medium { 'Lithograph' }
      colors { 'Color' }
      genre { 'Figurative' }
      dimensions { '27.5 x 21.5"' }
      size { 'Medium' }
      series { '"8/200"' }
      bib_number { nil }
      mms_id { nil }
      barcode { 'c093329406' }
      circulation { 'NON-CIRC' }
      location { 'OVERSIZED' }
      value { '6000' }
      appraisal_date { '2006' }
      notes { '17740940, b16398202' }
      reserve_date { nil }
    end
  end
end
