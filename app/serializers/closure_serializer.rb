class ClosureSerializer
  include JSONAPI::Serializer

  attributes(*Closure::JSONAPI_ATTRS)
end
