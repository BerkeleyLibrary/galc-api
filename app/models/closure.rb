require 'tzinfo'

class Closure < ApplicationRecord
  # ------------------------------------------------------------
  # Constants

  TZ_NAME = 'America/Los_Angeles'.freeze # TODO: something smarter
  TIMEZONE = TZInfo::Timezone.get(TZ_NAME)

  SELECT_CURRENT_SQL = <<~SQL.squish.freeze
    SELECT closures.id
      FROM closures,
           (SELECT DATE(DATE_TRUNC('day', CURRENT_TIMESTAMP, '#{TZ_NAME}')) AS today) t
     WHERE closures.start_date <= t.today
       AND (closures.end_date IS NULL
            OR closures.end_date > t.today)
  SQL

  SELECT_FUTURE_SQL = <<~SQL.squish.freeze
    SELECT closures.id
      FROM closures,
           (SELECT DATE(DATE_TRUNC('day', CURRENT_TIMESTAMP, '#{TZ_NAME}')) AS today) t
     WHERE closures.start_date > t.today
  SQL

  SELECT_PAST_SQL = <<~SQL.squish.freeze
    SELECT closures.id
      FROM closures,
           (SELECT DATE(DATE_TRUNC('day', CURRENT_TIMESTAMP, '#{TZ_NAME}')) AS today) t
     WHERE closures.end_date <= t.today
  SQL

  FILTER_QUERIES = {
    current: SELECT_CURRENT_SQL,
    future: SELECT_FUTURE_SQL,
    past: SELECT_PAST_SQL
  }.freeze
  FILTER_PARAMS = FILTER_QUERIES.keys.freeze

  # NOTE: We don't use default_scope because it mucks up query composition
  DEFAULT_ORDER = { end_date: :desc, start_date: :asc }.freeze

  ALL_ATTRS = Closure.column_names.map(&:to_sym).freeze
  DATA_ATTRS = (ALL_ATTRS - [:id]).freeze
  EDIT_ATTRS = (DATA_ATTRS - %i[created_at updated_at]).freeze
  SYNTH_ATTRS = %i[past current future].freeze
  JSONAPI_ATTRS = (DATA_ATTRS + SYNTH_ATTRS).freeze

  # ------------------------------------------------------------
  # Validations

  validates :start_date, presence: true
  validate :start_date_before_end_date

  def start_date_before_end_date
    return unless start_date && end_date
    return if start_date < end_date

    msg = "Closure start date #{start_date} must precede end date #{end_date}"
    errors.add(:end_date, msg)
  end

  # ------------------------------------------------------------
  # Scopes

  # TODO: is this complexity really necessary? should it be in the controller instead?

  FILTER_QUERIES.each do |scope_name, query|
    scope scope_name, -> { where("id IN (#{query})").order(**DEFAULT_ORDER) }
    scope "not_#{scope_name}".to_sym, -> { where("id NOT IN (#{query})").order(**DEFAULT_ORDER) }
  end

  scope :filter_by, ->(filters) {
    unfiltered = filters.empty? || FILTER_PARAMS.all? { |p| filters[p] }
    base = unfiltered ? Closure : where(condition_from(filters))
    base.order(**DEFAULT_ORDER)
  }

  # ------------------------------------------------------------
  # Overrides

  def start_date=(value)
    super(ensure_local(value))
  end

  def end_date=(value)
    super(ensure_local(value))
  end

  # ------------------------------------------------------------
  # Synthetic accessors

  def future?
    to_local_midnight(start_date) > Time.current
  end

  alias future future?

  def past?
    end_date && to_local_midnight(end_date) <= Time.current
  end

  alias past past?

  def current?
    !(future || past)
  end

  alias current current?

  # ------------------------------------------------------------
  # Class methods

  class << self
    def effective_current_closure
      Closure.current.first
    end

    def reopen_date
      return unless (ecc = effective_current_closure)

      ecc.end_date
    end

    def condition_from(filters)
      filters.inject(nil) do |conds, (filter, wanted)|
        cond = "ID #{wanted ? 'IN' : 'NOT IN'} (#{FILTER_QUERIES[filter]})"
        next cond if conds.nil?

        "#{conds} #{wanted ? 'OR' : 'AND'} (#{cond})"
      end
    end
  end

  private

  def ensure_local(date)
    date.respond_to?(:zone) ? date.in_time_zone(TIMEZONE) : date
  end

  def to_local_midnight(date)
    d = ensure_local(date)
    Time.new(d.year, d.month, d.day, 0, 0, 0, TIMEZONE)
  end

end
