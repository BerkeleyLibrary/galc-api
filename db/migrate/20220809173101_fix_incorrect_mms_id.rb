class FixIncorrectMMSId < ActiveRecord::Migration[7.0]

  OLD_ID = '991051112729706532'
  NEW_ID = '991051112769706532'

  def up
    sql = 'UPDATE items SET mms_id = :new_id where mms_id = :old_id'
    stmt = ActiveRecord::Base.sanitize_sql([sql, { old_id: OLD_ID, new_id: NEW_ID }])
    exec_update(stmt)
  end

  def down
    sql = 'UPDATE items SET mms_id = :old_id where mms_id = :new_id'
    stmt = ActiveRecord::Base.sanitize_sql([sql, { old_id: OLD_ID, new_id: NEW_ID }])
    exec_update(stmt)
  end
end
