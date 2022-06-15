class UserSerializer
  include JSONAPI::Serializer

  attributes(:uid, :display_name, :email, :galc_admin, :debug)

  set_id(:uid)
end
