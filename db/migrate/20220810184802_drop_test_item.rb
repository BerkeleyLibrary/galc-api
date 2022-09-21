# Ensure migration can run without error even if we delete/rename the models
(class Facet < ActiveRecord::Base; end) unless defined?(Facet)
(class Item < ActiveRecord::Base; end) unless defined?(Item)
(class Term < ActiveRecord::Base; end) unless defined?(Term)

class DropTestItem < ActiveRecord::Migration[7.0]

  ITEM_ATTRS = {
    image: "cooper_mouth.jpg",
    title: "Alvin's Test Record",
    artist: "Alvin Pollock",
    date: "Oct 2020",
    description: "Kitty picture",
    thumbnail: "cooper_mouth_360px.jpg",
    suppressed: true
  }

  ITEM_TERMS = {
    'Appearance' => 'Color',
    'Size' => 'Small',
    'Decade' => 'After 1999',
    'Genre' => 'Animals',
    'Medium' => 'Photograph'
  }

  def up
    return if Rails.env.test?

    item = Item.find_by!(ITEM_ATTRS)
    item.destroy!
  end

  def down
    return if Rails.env.test?

    item = Item.create!(ITEM_ATTRS)
    item.terms = ITEM_TERMS.map do |fn, tv|
      facet = Facet.find_by(name: fn)
      facet.terms.where(value: tv).first
    end
  end
end
