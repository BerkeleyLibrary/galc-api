require 'berkeley_library/alma'

module AvailabilityService
  include BerkeleyLibrary::Alma::SRU

  class << self
    include AvailabilityService
  end

  # Gets the availability for the specified records.
  #
  # @param mms_ids Array<String> a list of MMS IDs
  # @return Hash<String, Boolean> a hash from MMS IDs to availability.
  #   Note that the order of the hash is not guaranteed.
  def availability_for(*mms_ids)
    return {} unless (reader = get_marc_records(*mms_ids))

    reader.each_with_object({}) do |marc_record, availability|
      next unless (record_id = marc_record.record_id)

      ava_sf_e_values = marc_record.spec('AVA$e/#-#')
      availability[record_id] = ava_sf_e_values.include?('available')
    end
  end
end
