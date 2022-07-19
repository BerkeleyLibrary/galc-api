class BuildInfoSerializer
  include JSONAPI::Serializer

  SERIALIZED_ATTRS = BuildInfo::BUILD_VARS.map(&:downcase).map(&:to_sym).freeze

  attributes(*SERIALIZED_ATTRS)

  set_id(:git_commit)
end
