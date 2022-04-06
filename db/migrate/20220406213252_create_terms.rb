class CreateTerms < ActiveRecord::Migration[7.0]
  def change
    create_table :terms do |t|
      t.string :value, null: false, index: { unique: true }
      t.references :facet, null: false, foreign_key: true
      t.references :parent, null: true, foreign_key: {  to_table: :terms }

      t.timestamps
    end
  end
end
