# Migration to add "Digital" and "Drawing" terms to the "Medium" facet.
class AddTwoTerms < ActiveRecord::Migration[7.0]
  def up
    facet = Facet.find_by!(name: "Medium")
    Term.create!(facet: facet, value: "Digital")
    Term.create!(facet: facet, value: "Drawing")
  end

  def down
    facet = Facet.find_by!(name: "Medium")
    Term.where(facet: facet, value: ["Digital", "Drawing"]).delete_all
  end
end
