class ClosureOct2022 < ActiveRecord::Migration[7.0]

  ATTRS = { note: 'Closed till 2022-10-17', start_date: Date.new(2022, 10, 3), end_date: Date.new(2022, 10, 17) }

  def up
    Closure.find_or_create_by!(**ATTRS)
  end

  def down
    return unless (cls = Closure.find_by(**ATTRS))

    cls.destroy!
  end
end
