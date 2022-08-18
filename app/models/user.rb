class User
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Serialization
  include BerkeleyLibrary::Logging

  # ------------------------------------------------------------
  # Constants

  # LDAP `berkeleyEduIsMemberOf` value for the GALC admin group.
  GALC_ADMIN_GROUP = 'cn=edu:berkeley:org:libr:galc:galc-admins,ou=campus groups,dc=berkeley,dc=edu'.freeze

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

  # @return [String] Debug information
  attribute :debug, :string

  alias galc_admin? galc_admin

  # ------------------------------------------------------------
  # Initializer

  def initialize(uid: nil, display_name: nil, email: nil, galc_admin: false, debug: nil)
    super
  end

  # ------------------------------------------------------------
  # Class methods

  class << self
    def from_omniauth(auth)
      auth_extra = auth['extra']

      new(
        debug: 'omniauth',
        uid: auth_extra['uid'],
        display_name: auth_extra['displayName'],
        email: auth_extra['berkeleyEduOfficialEmail'],
        galc_admin: galc_admin?(auth_extra['berkeleyEduIsMemberOf'])
      )
    end

    def from_jwt_payload(payload)
      new(
        debug: 'jwt',
        uid: payload['sub'],
        display_name: payload['name'],
        email: payload['email'],
        galc_admin: galc_admin?(payload['groups'])
      )
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
