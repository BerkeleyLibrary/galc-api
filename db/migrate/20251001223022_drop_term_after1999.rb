class DropTermAfter1999 < ActiveRecord::Migration[7.0]
  def up
    facet = Facet.find_by!(name: 'Decade')
    exec_delete("DELETE FROM terms WHERE facet_id = #{facet.id} and value = 'After 1999' and ord = 15")
  end

  def down
    facet = Facet.find_by!(name: 'Decade')
    Term.create!(facet: facet, value: "After 1999", ord: 15)
  end
end
