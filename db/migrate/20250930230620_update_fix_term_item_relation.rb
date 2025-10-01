class UpdateFixTermItemRelation < ActiveRecord::Migration[7.0]
  def up
    execute <<~SQL.squish
      old_id = select_value("SELECT id FROM terms WHERE value = 'After 1999'")
      new_id = select_value("SELECT id FROM terms WHERE value = 'After 2020'")
      return unless old_id && new_id

      WITH target AS (
        SELECT it.term_id, it.item_id
        FROM items i
        JOIN items_terms it ON i.id = it.item_id
        JOIN terms t ON it.term_id = t.id
        WHERE t.id = #{old_id}
          AND i.date = '[2020]'
      )
      UPDATE items_terms it
      SET term_id = #{new_id}
      FROM target
      WHERE it.item_id = target.item_id
      AND it.term_id = target.term_id;
    SQL
  end

  def up
     new_id = select_value("SELECT id FROM terms WHERE value = 'After 1999'")
     old_id = select_value("SELECT id FROM terms WHERE value = 'After 2020'")
      return unless old_id && new_id

    execute <<~SQL.squish
      WITH target AS (
        SELECT it.term_id, it.item_id
        FROM items i
        JOIN items_terms it ON i.id = it.item_id
        JOIN terms t ON it.term_id = t.id
        WHERE t.id = #{old_id}
          AND i.date = '[2020]'
      )
      UPDATE items_terms it
      SET term_id = #{new_id}
      FROM target
      WHERE it.item_id = target.item_id
      AND it.term_id = target.term_id;
    SQL
  end

end
