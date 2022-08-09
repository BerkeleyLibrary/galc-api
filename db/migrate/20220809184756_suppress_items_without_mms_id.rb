class SuppressItemsWithoutMMSId < ActiveRecord::Migration[7.0]
  def up
    stmt = <<~SQL.squish
      UPDATE items
         SET suppressed = true
       WHERE mms_id IS NULL
    SQL
    exec_update(stmt)
  end

  def down
    stmt = <<~SQL.squish
      UPDATE items
         SET suppressed = false
    SQL
    exec_update(stmt)
  end
end
