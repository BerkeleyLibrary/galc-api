class DropIncompleteItems < ActiveRecord::Migration[7.0]

  ITEMS_ATTRS = [
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
      image: 'Sato (Mask).jpg',
      title: 'The Mask Collector',
      artist: 'Sato, Rob',
      artist_url: 'https://www.robsato.com/',
      date: '2020',
      description: 'Risograph print, printed by Tiny Splendor. From the exhibition "Car Crash Picnic."',
      dimensions: '15.5 x 19"',
      thumbnail: 'Sato (Mask)_360px.jpg',
      suppressed: true
    }
  ]

  ITEMS_TERMS = [
    {
      'Appearance' => 'Black and White',
      'Size' => 'Small',
      'Decade' => 'After 1999',
      'Genre' => 'Animals',
      'Medium' => 'Linocut'
    },
    {
      'Appearance' => 'Color',
      'Size' => 'Small',
      'Decade' => 'After 1999',
      'Genre' => 'Figurative',
      'Medium' => 'Stencil'
    },
    {
      'Appearance' => 'Color',
      'Size' => 'Small',
      'Decade' => 'After 1999',
      'Genre' => ['Abstract', 'Figurative'],
      'Medium' => 'Stencil'
    }
  ]

  def up
    return if Rails.env.test?

    ITEMS_ATTRS.each do |item_attrs|
      cond = item_attrs.keys.map { |k| "#{k} = :#{k}" }.join(' AND ')
      sql = "SELECT id FROM items WHERE #{cond}"
      stmt = ActiveRecord::Base.sanitize_sql([sql, item_attrs])
      item_id = exec_query(stmt).to_a[0]['id']

      exec_delete("DELETE FROM items_terms WHERE item_id = #{item_id}")
      exec_delete("DELETE FROM items WHERE id = #{item_id}")
    end

    ActiveRecord::Base.connection.reset_pk_sequence!('items', :id, 'items_id_seq')
  end

  def down
    return if Rails.env.test?

    ITEMS_ATTRS.each_with_index do |item_attrs, i|
      columns = item_attrs.keys.join(', ') + ', created_at, updated_at'
      binds = item_attrs.keys.map { |k| ":#{k}" }.join(', ') + ', now(), now()'

      sql = "INSERT INTO items (#{columns}) VALUES (#{binds})"
      stmt = ActiveRecord::Base.sanitize_sql([sql, item_attrs])
      item_id = exec_insert(stmt).to_a[0]['id']

      item_terms = ITEMS_TERMS[i]
      item_terms.each do |fn, values|
        facet = Facet.find_by!(name: fn)
        values = Array(values)
        values.each do |tv|
          term = facet.terms.where(value: tv).first

          sql = 'INSERT INTO items_terms (item_id, term_id) VALUES (:item_id, :term_id)'
          stmt = ActiveRecord::Base.sanitize_sql([sql, { item_id: item_id, term_id: term.id }])
          exec_insert(stmt)
        end
      end
    end
  end
end
