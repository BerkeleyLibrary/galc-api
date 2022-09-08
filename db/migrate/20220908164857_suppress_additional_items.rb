# Ensure migration can run without error even if we delete/rename the models
(class Item < ActiveRecord::Base; end) unless defined?(Item)

class SuppressAdditionalItems < ActiveRecord::Migration[7.0]

  ITEM_ATTRS = [
    { title: 'Untitled (Bon a tirer)', artist: 'Abularach, Rodolfo' },
    { title: 'Man Reading (Lesender Mann)', artist: 'Schmidt-Rottluff, Karl' }
  ]

  def up
    ITEM_ATTRS.each do |attrs|
      item = Item.find_by!(suppressed: false, **attrs)
      item.suppressed = true
      item.save!
    end
  end

  def down
    ITEM_ATTRS.each do |attrs|
      item = Item.find_by!(suppressed: true, **attrs)
      item.suppressed = false
      item.save!
    end
  end
end
