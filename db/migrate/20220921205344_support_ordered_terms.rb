class SupportOrderedTerms < ActiveRecord::Migration[7.0]

  ORDERED_FACET_VALUES = {
    'Decade' => [
      'Before 1900',
      '1900-1909',
      '1910-1919',
      '1920-1929',
      '1930-1939',
      '1940-1949',
      '1950-1959',
      '1960-1969',
      '1970-1979',
      '1980-1989',
      '1990-1999',
      'After 1999',
      'No Date'
    ].freeze,
    'Size' => [
      'Small',
      'Medium',
      'Large',
      'Oversized'
    ].freeze
  }.freeze

  def change
    add_column(:facets, :ordered, :boolean, default: false, null: false)
    add_column(:terms, :ord, :integer)

    set_order!

    add_index(:terms, [:facet_id, :ord], unique: true)
  end

  private

  def set_order!
    return if Rails.env.test?

    ORDERED_FACET_VALUES.each do |facet_name, values|
      facet = Facet.find_by!(name: facet_name)
      facet.update(ordered: true)

      values.each_with_index do |value, i|
        term = Term.find_by!(facet: facet, value: value)
        term.update(ord: i)
      end
    end
  end
end
