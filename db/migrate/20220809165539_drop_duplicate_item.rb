# Ensure migration can run without error even if we delete/rename the models
(class Facet < ActiveRecord::Base; end) unless defined?(Facet)
(class Item < ActiveRecord::Base; end) unless defined?(Item)
(class Term < ActiveRecord::Base; end) unless defined?(Term)

class DropDuplicateItem < ActiveRecord::Migration[7.0]

  ITEM_ATTRS = {
    image: 'Schmidt Rottluff (Man Reading).jpg',
    title: 'Man Reading (Lesender Mann)',
    artist: 'Schmidt-Rottluff, Karl',
    artist_url: 'https://en.wikipedia.org/wiki/Karl_Schmidt-Rottluff',
    date: '1921',
    description: 'Unsigned. Title and author found on back of print.',
    circulation: 'NON-CIRC',
    location: 'Stored in box',
    value: '2500',
    notes: 'b18381410',
    thumbnail: 'Schmidt Rottluff (Man Reading)_360px.jpg'
  }

  ITEM_TERMS = {
    'Appearance' => 'Black and White',
    'Size' => 'Small',
    'Decade' => '1920-1929',
    'Genre' => 'Figurative',
    'Medium' => 'Woodcut'
  }

  def up
    item = Item.find_by!(ITEM_ATTRS)
    item.destroy!
  end

  def down
    item = Item.create!(ITEM_ATTRS)
    item.terms = ITEM_TERMS.map do |fn, tv|
      facet = Facet.find_by!(name: fn)
      facet.terms.where(value: tv).first
    end
  end
end
