class Closure < ApplicationRecord
  # ------------------------------------------------------------
  # Constants

  MSG_START_MUST_PRECEDE_END = 'Closure start date must precede end date'.freeze
  ALL_ATTRS = Closure.column_names.map(&:to_sym).freeze
  DATA_ATTRS = (ALL_ATTRS - [:id]).freeze
  EDIT_ATTRS = (DATA_ATTRS - %i[created_at updated_at]).freeze
  SYNTH_ATTRS = %i[current].freeze
  JSONAPI_ATTRS = (DATA_ATTRS + SYNTH_ATTRS).freeze

  TIME_ZONE = 'America/Los_Angeles'.freeze # TODO: something smarter

  SELECT_CURRENT_SQL = <<~SQL.squish.freeze
    SELECT closures.id
      FROM closures,
           (SELECT DATE(DATE_TRUNC('day', CURRENT_TIMESTAMP, '#{TIME_ZONE}')) AS today) t
     WHERE closures.start_date <= t.today
       AND closures.end_date IS NULL
        OR closures.end_date > t.today
  SQL

  # ------------------------------------------------------------
  # Validations

  validates :start_date, presence: true
  validate :start_date_before_end_date

  def start_date_before_end_date
    return unless start_date && end_date
    return if start_date < end_date

    errors.add(:end_date, MSG_START_MUST_PRECEDE_END)
  end

  # ------------------------------------------------------------
  # Scopes

  scope :current, -> { where("id IN (#{SELECT_CURRENT_SQL})").order(end_date: :desc) }
  scope :not_current, -> { where("id NOT IN (#{SELECT_CURRENT_SQL})") } # TODO: order?

  # ------------------------------------------------------------
  # Synthetic accessors

  def current?
    today = Date.current
    (today >= start_date) && (end_date.nil? || today < end_date)
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
  end
end