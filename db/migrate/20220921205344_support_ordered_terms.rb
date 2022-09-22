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

  def up
    add_column(:facets, :ordered, :boolean, default: false, null: false)
    add_column(:terms, :ord, :integer)
    Facet.reset_column_information
    Term.reset_column_information

    set_order!

    add_index(:terms, [:facet_id, :ord], unique: true)
  end

  def down
    remove_column(:terms, :ord)
    remove_column(:facets, :ordered)
  end

  private

  def set_order!
    sql = 'UPDATE facets SET ordered = true where facets.name IN (?)'
    stmt = ActiveRecord::Base.sanitize_sql([sql, ORDERED_FACET_VALUES.keys])
    exec_update(stmt)

    ORDERED_FACET_VALUES.each do |facet_name, values|
      values.each_with_index do |value, ord|
        sql = <<~SQL
          UPDATE terms
             SET ord = :ord
            FROM facets
           WHERE facets.id = terms.facet_id
             AND facets.name = :facet_name
             AND terms.value = :value
        SQL
        stmt = ActiveRecord::Base.sanitize_sql(
          [
            sql,
            { ord: ord, facet_name: facet_name, value: value}
          ]
        )
        exec_update(stmt)
      end
    end
  end
end
