class DropIncompleteItems < ActiveRecord::Migration[7.0]

  DATA = [
    {
      image: 'Breidenthal(Bat).jpg',
      title: 'Bat Kiss',
      artist: 'Breidenthal, Elinor',
      date: '2020',
      dimensions: '16 x 16"',
      thumbnail: 'Breidenthal(Bat)_360px.jpg',
      suppressed: true
    },
    {
      image: 'Ryan(Untitled).jpg',
      title: 'When I Was Your Age This Was All Orchards',
      artist: 'Ryan, David',
      date: '2020',
      description: 'Risograph print.',
      dimensions: '18.5 x 15.5"',
      thumbnail: 'Ryan(Untitled)_360px.jpg',
      suppressed: true
    },
    {
      :image => "Sato (Mask).jpg",
      :title => "The Mask Collector",
      :artist => "Sato, Rob",
      :artist_url => "https://www.robsato.com/",
      :date => "2020",
      :description => "Risograph print, printed by Tiny Splendor. From the exhibition \"Car Crash Picnic.\"",
      :dimensions => "15.5 x 19\"",
      :thumbnail => "Sato (Mask)_360px.jpg",
      :suppressed => true
    }
  ]

  def up
    return if Rails.env.test?

    DATA.each { |attrs| Item.find_by!(attrs).destroy! }
    ActiveRecord::Base.connection.reset_pk_sequence!('items', :id, 'items_id_seq')
  end

  def down
    return if Rails.env.test?

    DATA.each { |attrs| Item.create!(attrs) }
  end
end
