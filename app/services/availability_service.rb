require 'berkeley_library/alma'

module AvailabilityService
  include BerkeleyLibrary::Alma::SRU
  include BerkeleyLibrary::Logging

  class << self
    include AvailabilityService
  end

  # Gets the availability for the specified records.
  #
  # @param mms_ids Array<String> a list of MMS IDs
  # @return Hash<String, Boolean> a hash from MMS IDs to availability.
  #   Note that the order of the hash is not guaranteed.
  def availability_for(mms_ids)
    return {} unless (reader = marc_reader_for(mms_ids))

    # TODO: do we need to cache this?
    reader.each_with_object({}) do |marc_record, availability|
      next unless (record_id = marc_record.record_id)

      ava_sf_e_values = marc_record.spec('AVA$e/#-#')
      logger.warn('MARC record does not have an AVA$e', MARC::XMLWriter.encode(marc_record)) if ava_sf_e_values.empty?
      availability[record_id] = ava_sf_e_values.include?('available')
    end
  rescue StandardError => e
    logger.warn(e)
    {}
  end

  private

  def marc_reader_for(mms_ids)
    return if (ids = ensure_ids(mms_ids)).blank?

    logger.info("Retrieving availability for #{ids.size} IDs: #{ids.join(', ')}")

    get_marc_records(*ids)
  end

  def ensure_ids(mms_ids)
    return if mms_ids.blank?

    # noinspection RubyMismatchedReturnType
    Array(mms_ids).compact.uniq.filter_map { |id| BerkeleyLibrary::Alma::RecordId.parse(id) }
  end

end
