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
    item_attrs = ITEM_ATTRS
    cond = item_attrs.keys.map { |k| "#{k} = :#{k}" }.join(' AND ')
    sql = "SELECT id FROM items WHERE #{cond}"
    stmt = ActiveRecord::Base.sanitize_sql([sql, item_attrs])
    item_id = exec_query(stmt).to_a[0]['id']

    exec_delete("DELETE FROM items_terms WHERE item_id = #{item_id}")
    exec_delete("DELETE FROM items WHERE id = #{item_id}")
  end

  def down
    item_attrs = ITEM_ATTRS
    columns = item_attrs.keys.join(', ') + ", created_at, updated_at"
    binds = item_attrs.keys.map { |k| ":#{k}" }.join(', ') + ", now(), now()"

    sql = "INSERT INTO items (#{columns}) VALUES (#{binds})"
    stmt = ActiveRecord::Base.sanitize_sql([sql, item_attrs])
    item_id = exec_insert(stmt).to_a[0]['id']

    item_terms = ITEM_TERMS
    item_terms.each do |fn, tv|
      facet = Facet.find_by!(name: fn)
      term = facet.terms.where(value: tv).first

      sql = "INSERT INTO items_terms (item_id, term_id) VALUES (:item_id, :term_id)"
      stmt = ActiveRecord::Base.sanitize_sql([sql, { item_id: item_id, term_id: term.id }])
      exec_insert(stmt)
    end
  end
end
