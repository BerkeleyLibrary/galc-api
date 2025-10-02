class AddThreeOrderedTerms < ActiveRecord::Migration[7.0]
  def up
    facet = Facet.find_by!(name: "Decade")

    # Add and remove terms from facet "Decade", and reorder them.
    # The term "After 1999" is no longer needed and will be removed 
    # when all items_terms have been updated
    term  = Term.find_by!(facet: facet, value: "After 1999")
    term.update!(ord: 15)
    term  = Term.find_by!(facet: facet, value: "No Date")
    term.update!(ord: 14)
     
    Term.create!(facet: facet, value: "2000-2009", ord: 11)
    Term.create!(facet: facet, value: "2010-2019", ord: 12)
    Term.create!(facet: facet, value: "After 2020",ord: 13)
  end

  def down
    facet = Facet.find_by!(name: "Decade")
    Term.where(facet: facet, value: ["2000-2009", "2010-2019", "After 2020"]).delete_all
    term  = Term.find_by!(facet: facet, value: "After 1999")
    term.update!(ord: 11)
    term  = Term.find_by!(facet: facet, value: "No Date")
    term.update!(ord: 12)
  end
end

