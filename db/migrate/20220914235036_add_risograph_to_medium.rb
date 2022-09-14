# Ensure migration can run without error even if we delete/rename the models
(class Facet < ActiveRecord::Base; end) unless defined?(Facet)
(class Term < ActiveRecord::Base; end) unless defined?(Term)

class AddRisographToMedium < ActiveRecord::Migration[7.0]
  def up
    Term.create!(value: 'Risograph', facet: facet_medium)
  end

  def down
    term = Term.find_by!(value: 'Risograph', facet: facet_medium)
    term.destroy!
  end

  private

  def facet_medium
    @facet_medium ||= Facet.find_by!(name: 'Medium')
  end
end
