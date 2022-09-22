class SuppressAdditionalItems < ActiveRecord::Migration[7.0]

  ITEM_ATTRS = [
    { title: 'Untitled (Bon a tirer)', artist: 'Abularach, Rodolfo' },
    { title: 'Man Reading (Lesender Mann)', artist: 'Schmidt-Rottluff, Karl' }
  ]

  def up
    return if Rails.env.test?

    ITEM_ATTRS.each do |attrs|
      item = Item.find_by!(suppressed: false, **attrs)
      item.suppressed = true
      item.save!
    end
  end

  def down
    return if Rails.env.test?

    ITEM_ATTRS.each do |attrs|
      item = Item.find_by!(suppressed: true, **attrs)
      item.suppressed = false
      item.save!
    end
  end
end
