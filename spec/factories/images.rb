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

    factory :image_jo do
      basename { 'Jo(RIP).jpg' }
      thumbnail { 'Jo(RIP)_360px.jpg' }
    end

    factory :image_tachibana do
      basename { 'Tachibana(Conversation).jpg' }
      thumbnail { 'Tachibana(Conversation)_360px.jpg' }
    end

    factory :image_rosa do
      basename { 'Rosa (Democritus).jpg' }
      thumbnail { 'Rosa (Democritus)_360px.jpg' }
    end
  end
end
