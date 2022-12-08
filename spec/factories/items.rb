FactoryBot.define do
  factory :item, aliases: [:item_minami] do
    image { association :image_minami }
    title { 'Arbre (Tree)' }
    artist { 'Minami, Keiko' }
    artist_url { 'https://en.wikipedia.org/wiki/Keiko_Minami' }
    date { '1955' }
    # decade { '1950-1959' }
    description { 'Signed and numbered.' }
    # medium { 'Aquatint, Etching' }
    # colors { 'Color' }
    # genre { 'Landscape' }
    dimensions { '19 x 20"' }
    # size { 'Medium' }
    series { '"16/50"' }
    mms_id { '991051069589706532' }
    barcode { 'C091134068' }
    circulation { 'NON-CIRC' }
    location { 'Stored in box' }
    value { '500' }
    appraisal_date { '2006' }
    notes { '17358704' }
    reserve_date { '2019-09-10' }
    suppressed { false }

    terms do
      [
        association(:term_color),
        association(:term_medium),
        association(:term_1950_1959),
        association(:term_landscape),
        association(:term_aquatint),
        association(:term_etching)
      ]
    end

    factory :item_reyes, aliases: %i[nil_circulation nil_location nil_notes] do
      image { association :image_reyes }

      title { 'Eastern Sierras (Color)' }
      artist { 'Reyes, Fernando' }
      artist_url { 'http://www.freyesart.com/about/' }
      date { '2000' }
      # decade { 'After 1999' }
      description { 'Signed and numbered.' }
      # medium { 'Woodcut' }
      # colors { 'Color' }
      # genre { 'Landscape' }
      dimensions { '15.5 x 17.5"' }
      # size { 'Small' }
      series { '"13/20"' }
      mms_id { '991078545009706532' }
      barcode { 'C094893488' }
      circulation { nil }
      location { nil }
      value { '500' }
      appraisal_date { '2006' }
      notes { nil }
      reserve_date { '2019-08-28' }
      suppressed { false }

      terms do
        [
          association(:term_color),
          association(:term_small),
          association(:term_after_1999),
          association(:term_landscape),
          association(:term_woodcut)
        ]
      end
    end

    factory :item_jo, aliases: %i[nil_reserve_date] do
      image { association :image_jo }

      title { 'RIP 2020' }
      artist { 'Jo, Hellen' }
      artist_url { 'https://helllllen.org/' }
      date { '2021' }
      description { '5-color Riso print. Printed at Tiny Splendor in Oakland, CA. Signed and dated.' }
      dimensions { '18 x 22"' }
      series { nil }
      mms_id { '991085987124606532' }
      barcode { 'C103796273' }
      circulation { nil }
      location { nil }
      value { nil }
      appraisal_date { nil }
      notes { nil }
      reserve_date { nil }
      suppressed { false }

      terms do
        [
          association(:term_color),
          association(:term_figurative),
          association(:term_risograph),
          association(:term_after_1999),
          association(:term_medium)
        ]
      end
    end

    factory :item_tachibana do
      image { association :image_tachibana }

      title { 'conversation #8' }
      artist { 'Tachibana, Seiko' }
      artist_url { 'https://www.seikotachibana.net/' }
      date { '2004' }
      description { 'Hand-signed by artist. Floated in frame.' }
      dimensions { '23 x 21"' }
      series { '4/5' }
      mms_id { '991056573449706532' }
      barcode { nil }
      circulation { nil }
      location { nil }
      value { nil }
      appraisal_date { nil }
      notes { nil }
      reserve_date { nil }
      suppressed { false }

      terms do
        [
          association(:term_color),
          association(:term_abstract),
          association(:term_intaglio),
          association(:term_after_1999),
          association(:term_medium)
        ]
      end
    end

    factory :item_rosa, aliases: %i[nil_mms_id nil_description item_suppressed] do
      image { association :image_rosa }

      title { 'Democritus in Meditation' }
      artist { 'Rosa, Salvator' }
      artist_url { 'https://en.wikipedia.org/wiki/Salvator_Rosa' }
      date { '1662' }
      description { nil }
      dimensions { '27.5 x 19.5"' }
      series { nil }
      mms_id { nil }
      barcode { 'C093329080' }
      circulation { 'NON-CIRC' }
      location { nil }
      value { '1600' }
      appraisal_date { nil }
      notes { 'b16398095' }
      reserve_date { nil }
      suppressed { true }

      terms do
        [
          association(:term_black_and_white),
          association(:term_figurative),
          association(:term_etching),
          association(:term_before_1900),
          association(:term_medium)
        ]
      end
    end
  end
end
