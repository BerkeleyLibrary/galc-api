class Reservation
  include ActiveModel::API

  # ------------------------------------------------------------
  # Accessors

  attr_accessor :user, :item

  # ------------------------------------------------------------
  # Validations

  validates :user, :item, presence: true
  validate :user_authenticated
  validate :item_available

  # ------------------------------------------------------------
  # Public methods

  # For JSONAPI relationship serialization
  def item_id
    item.id
  end

  # For JSONAPI relationship serialization
  def user_id
    user.uid
  end

  # ------------------------------------------------------------
  # Private methods

  private

  # ------------------------------
  # Validators

  def user_authenticated
    return if user.blank?
    return if user.authenticated?

    errors.add(:user, 'is not authenticated')
  end

  def item_available
    return if item.blank?
    return if AvailabilityService.available?(item)

    errors.add(:item, 'is not available')
  end
end
