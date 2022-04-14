class CreateJoinTableItemTerm < ActiveRecord::Migration[7.0]
  def change
    create_join_table :items, :terms do |t|
      t.index [:item_id, :term_id], unique: true
      t.index [:term_id, :item_id], unique: true
    end

    add_foreign_key :items_terms, :items
    add_foreign_key :items_terms, :terms
  end
end
