FactoryBot.define do
  factory :image, aliases: [:image_minami] do
    basename { 'Minami(Tree).jpg' }
    thumbnail { 'Minami(Tree)_360px.jpg' }

    to_create do |instance|
      instance.id = Image.find_or_create_by(
        basename: instance.basename,
        thumbnail: instance.thumbnail
      ).id
      instance.reload
    end

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
