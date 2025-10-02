# Migration summary:
# After running `up`, the "Decade" facet will have terms:
#   - "2000-2009" (ord: 11)
#   - "2010-2019" (ord: 12)
#   - "After 2020" (ord: 13)
#   - "No Date" (ord: 14)
#   - "After 1999" (ord: 15, to be removed after updating items_terms)
# After running `down`, the "Decade" facet will have:
#   - "No Date" (ord: 12)
#   - "After 1999" (ord: 11)
#   - The three new terms will be deleted.

class AddThreeOrderedTerms < ActiveRecord::Migration[7.0]
  def up
    facet = Facet.find_by!(name: "Decade")
    term  = Term.find_by!(facet: facet, value: "After 1999")
    # NOTE: Ensure all related items_terms records are updated before removing "After 1999" to prevent orphaned references.
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

