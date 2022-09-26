class CreateClosures < ActiveRecord::Migration[7.0]
  def change
    create_table :closures do |t|
      t.date :start_date, null: false
      t.date :end_date
      t.text :note

      t.timestamps

      t.index [:start_date, :end_date], unique: true

      # NOTE: If end_date is null, end_date > start_date is also null and
      #       PostgreSQL considers this check passed
      t.check_constraint('end_date > start_date', name: 'valid_date_range')
    end
  end
end
