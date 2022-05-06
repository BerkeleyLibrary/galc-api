require 'jsonapi/error_serializer'

module JSONAPI
  class ErrorSerializer
    attribute :meta do |object|
      object.try(:meta) || object.try(:fetch, :meta, nil)
    end
  end
end
