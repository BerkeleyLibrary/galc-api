class UserSerializer
  include JSONAPI::Serializer

  attributes(:uid, :display_name, :email)

  set_id(:uid)
end
