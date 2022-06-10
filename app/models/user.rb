class User
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Serialization
  include BerkeleyLibrary::Logging

  # ------------------------------------------------------------
  # Constants

  # Attributes that will be serialized in the session, and their default values.
  SERIALIZED_ATTRS = { uid: nil, display_name: nil, email: nil, galc_admin: false }.freeze

  # LDAP `berkeleyEduIsMemberOf` value for the GALC admin group.
  GALC_ADMIN_GROUP = 'cn=edu:berkeley:org:libr:galc:galc-admins,ou=campus groups,dc=berkeley,dc=edu'.freeze

  # Key to look up the current user in the session
  SESSION_KEY = :user

  # ------------------------------------------------------------
  # Accessors

  # @return [String]
  attribute :uid, :string

  # @return [String]
  attribute :display_name, :string

  # @return [String] The user's email address.
  attribute :email, :string

  # @return [Boolean] True if the user is a GALC administrator, false otherwise.
  attribute :galc_admin, :boolean

  alias galc_admin? galc_admin

  # ------------------------------------------------------------
  # Initializer

  def initialize(uid: nil, display_name: nil, email: nil, galc_admin: false)
    super
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

    def from_jwt_payload(payload)
      new(
        uid: payload['sub'],
        display_name: payload['name'],
        email: payload['email'],
        galc_admin: galc_admin?(payload['groups'])
      )
    end

    def from_session(session)
      session_attributes = (session && session[SESSION_KEY]) || {}
      allowed_attributes = session_attributes.slice(*attribute_names)
      new(**allowed_attributes.symbolize_keys)
    end

    private

    def galc_admin?(groups)
      groups && groups.include?(GALC_ADMIN_GROUP)
    end
  end

  # ------------------------------------------------------------
  # Instance methods

  # @return [Boolean] True if the current user is authenticated, false otherwise
  def authenticated?
    !uid.nil?
  end

  def to_jwt_payload
    payload = { sub: uid, name: display_name, email: email }
    payload['groups'] = [GALC_ADMIN_GROUP] if galc_admin?
    payload.with_indifferent_access
  end
end
