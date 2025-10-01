class UpdateFixTermItemRelation < ActiveRecord::Migration[7.0]
  def up
    after_1999_id = select_value("SELECT id FROM terms WHERE value = 'After 1999'")
    after_2000_id = select_value("SELECT id FROM terms WHERE value = 'After 2020'")
    return unless after_1999_id && after_2000_id
    
    execute <<~SQL.squish
      WITH target AS (
        SELECT it.term_id, it.item_id
        FROM items i
        JOIN items_terms it ON i.id = it.item_id
        JOIN terms t ON it.term_id = t.id
        WHERE t.id = #{after_1999_id}
          AND i.date = '[2020]'
      )
      UPDATE items_terms it
      SET term_id = #{after_2000_id}
      FROM target
      WHERE it.item_id = target.item_id
      AND it.term_id = target.term_id;
    SQL
  end

  def down
    after_1999_id = select_value("SELECT id FROM terms WHERE value = 'After 1999'")
    after_2000_id = select_value("SELECT id FROM terms WHERE value = 'After 2020'")
    return unless after_1999_id && after_2000_id

    execute <<~SQL.squish
      WITH target AS (
        SELECT it.term_id, it.item_id
        FROM items i
        JOIN items_terms it ON i.id = it.item_id
        JOIN terms t ON it.term_id = t.id
        WHERE t.id = #{after_2000_id}
          AND i.date = '[2020]'
      )
      UPDATE items_terms it
      SET term_id = #{after_1999_id}
      FROM target
      WHERE it.item_id = target.item_id
      AND it.term_id = target.term_id;
    SQL
  end

end
