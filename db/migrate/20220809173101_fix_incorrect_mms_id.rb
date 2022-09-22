class FixIncorrectMMSId < ActiveRecord::Migration[7.0]

  OLD_ID = '991051112729706532'
  NEW_ID = '991051112769706532'

  def up
    item = Item.find_by!(mms_id: OLD_ID)
    item.update!(mms_id: NEW_ID)
  end

  def down
    item = Item.find_by!(mms_id: NEW_ID)
    item.update!(mms_id: OLD_ID)
  end
end
