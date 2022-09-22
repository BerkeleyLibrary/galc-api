class AddRisographToMedium < ActiveRecord::Migration[7.0]
  def up
    return if Rails.env.test?

    Term.create!(value: 'Risograph', facet: facet_medium)
  end

  def down
    return if Rails.env.test?

    term = Term.find_by!(value: 'Risograph', facet: facet_medium)
    term.destroy!
  end

  private

  def facet_medium
    @facet_medium ||= Facet.find_by!(name: 'Medium')
  end
end
