FactoryBot.define do
  factory :image, aliases: [:image_minami] do
    basename { 'Minami(Tree).jpg' }
    thumbnail { 'Minami(Tree)_360px.jpg' }

    factory :image_reyes do
      basename { 'Reyes (Eastern Sierras Color).jpg' }
      thumbnail { 'Reyes (Eastern Sierras Color)_360px.jpg' }
    end

    factory :image_moore do
      basename { 'Moore(SeatedFigures).jpg' }
      thumbnail { 'Moore(SeatedFigures)_360px.jpg' }
    end
  end
end
