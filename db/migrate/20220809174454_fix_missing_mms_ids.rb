class FixMissingMMSIds < ActiveRecord::Migration[7.0]

  MISSING = {
    '991051112429706532' => 'alularach (bon).jpg',
    '991051112729706532' => 'Ballif(Composition).jpg',
    '991051120489706532' => 'Chavez (tsk tsk).jpg',
    '991051285959706532' => 'stasik (untitled).jpg',
    '991051350169706532' => 'Fitreman(LaGrande).jpg',
    '991056573429706532' => 'Schuster(Boisson).jpg',
    '991056573529706532' => 'Obata(Horse).jpg',
    '991056573609706532' => 'Oparah(Unititled).jpg',
    '991056573699706532' => 'Piper(High).jpg',
    '991056573739706532' => 'Roovers(Dutch).jpg',
    '991056573769706532' => 'Silverman(Umbria).jpg',
    '991056573879706532' => 'Dorny(Kilkenny.jpg',
    '991056573909706532' => 'Arnold(White).jpg',
    '991056573939706532' => 'Ross(Farm).jpg',
    '991078486649706532' => 'Rutherford (Iowa).jpg'
  }

  def up
    stmt = <<~SQL.squish
      UPDATE items
         SET mms_id = missing.mms_id
        FROM (VALUES
             #{MISSING.map { |mms_id, image| "('#{mms_id}', '#{image}')" }.join(', ')}
             ) AS missing(mms_id, image)
       WHERE items.image = missing.image
    SQL
    exec_update(stmt)
  end

  def down
    stmt = <<~SQL.squish
      UPDATE items
         SET mms_id = NULL
       WHERE mms_id IN (#{MISSING.keys.map { |mms_id| "'#{mms_id}'" }.join(', ' )})
    SQL
    exec_update(stmt)
  end
end
