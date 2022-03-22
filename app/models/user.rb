class User
  include ActiveModel::Serialization
  include BerkeleyLibrary::Logging

  # ------------------------------------------------------------
  # Constants

  # Attributes that will be serialized in the session, and their default values.
  SERIALIZED_ATTRS = { uid: nil, display_name: nil, email: nil, galc_admin: false }.freeze

  # LDAP `berkeleyEduIsMemberOf` value for the GALC admin group.
  GALC_ADMIN_GROUP = 'cn=edu:berkeley:org:libr:galc:LIBR-galc-admins,ou=campus groups,dc=berkeley,dc=edu'.freeze

  # Key to look up the current user in the session
  SESSION_KEY = :user

  # ------------------------------------------------------------
  # Accessors

  # @return [String]
  attr_reader :uid

  # @return [String]
  attr_reader :display_name

  # @return [String] The user's email address.
  attr_reader :email

  # @return [Boolean] True if the user is a GALC administrator, false otherwise.
  attr_reader :galc_admin

  alias galc_admin? galc_admin

  # ------------------------------------------------------------
  # Initializer

  def initialize(uid: nil, display_name: nil, email: nil, galc_admin: false)
    @uid = uid
    @display_name = display_name
    @email = email
    @galc_admin = galc_admin
  end

  # ------------------------------------------------------------
  # Class methods

  class << self
    def from_omniauth(auth)
      auth_extra = auth['extra']

      new(
        uid: auth_extra['uid'],
        display_name: auth_extra['displayName'],
        email: auth_extra['berkeleyEduOfficialEmail'],
        galc_admin: galc_admin?(auth_extra['berkeleyEduIsMemberOf'])
      )
    end

    def from_session
      session_attributes = (session && session[SESSION_KEY]) || {}
      allowed_attributes = session_attributes.slice(*attribute_names)
      new(**allowed_attributes.symbolize_keys)
    end

    private

    def galc_admin?(cal_groups)
      cal_groups && cal_groups.include?(GALC_ADMIN_GROUP)
    end
  end

  # ------------------------------------------------------------
  # Instance methods

  # ------------------------------
  # ActiveModel::Serialization

  # Default attribute hash. Used by ActiveModel::Serialization to
  # implement `#attribute_names` and `#serializable_hash`.
  #
  # @return [Hash<String, Object>] a hash of default attribute values
  def attributes
    SERIALIZED_ATTRS.stringify_keys
  end
end
