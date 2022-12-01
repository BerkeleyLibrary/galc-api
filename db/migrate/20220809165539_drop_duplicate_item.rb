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
    cond = ITEM_ATTRS.keys.map { |k| "#{k} = :#{k}" }.join(' AND ')
    sql = "SELECT id FROM items WHERE #{cond}"
    stmt = ActiveRecord::Base.sanitize_sql([sql, ITEM_ATTRS])
    item_id = exec_query(stmt).to_a[0]['id']

    exec_delete("DELETE FROM items_terms WHERE item_id = #{item_id}")
    exec_delete("DELETE FROM items WHERE id = #{item_id}")
  end

  def down
    columns = ITEM_ATTRS.keys.join(', ') + ", created_at, updated_at"
    binds = ITEM_ATTRS.keys.map { |k| ":#{k}" }.join(', ') + ", now(), now()"

    sql = "INSERT INTO items (#{columns}) VALUES (#{binds})"
    stmt = ActiveRecord::Base.sanitize_sql([sql, ITEM_ATTRS])
    item_id = exec_insert(stmt).to_a[0]['id']

    ITEM_TERMS.each do |fn, tv|
      facet = Facet.find_by!(name: fn)
      term = facet.terms.where(value: tv).first

      sql = "INSERT INTO items_terms (item_id, term_id) VALUES (:item_id, :term_id)"
      stmt = ActiveRecord::Base.sanitize_sql([sql, { item_id: item_id, term_id: term.id }])
      exec_insert(stmt)
    end
  end
end
