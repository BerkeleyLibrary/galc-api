class AddAllowMultipleToFacets < ActiveRecord::Migration[7.0]
  STMT = "UPDATE facets SET allow_multiple = true WHERE name IN ('Genre', 'Medium')"

  def up
    add_column :facets, :allow_multiple, :boolean, default: false, null: false
    Facet.reset_column_information

    exec_update(STMT)
  end

  def down
    remove_column :facets, :allow_multiple
    Facet.reset_column_information
  end
end
