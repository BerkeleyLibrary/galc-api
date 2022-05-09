require 'berkeley_library/alma'

module AvailabilityService
  include BerkeleyLibrary::Alma::SRU
  include BerkeleyLibrary::Logging

  # ------------------------------------------------------------
  # Constants

  CACHE_EXPIRY = 5.minutes

  # ------------------------------------------------------------
  # Class methods

  class << self
    include AvailabilityService
  end

  # ------------------------------------------------------------
  # Accessors

  # For testing
  attr_accessor :max_records

  # ------------------------------------------------------------
  # Public instance methods

  # Gets the availability for the specified records.
  #
  # @param mms_ids Array<String> a list of MMS IDs
  # @return Hash<String, Boolean> a hash from MMS IDs to availability.
  #   Note that the order of the hash is not guaranteed.
  def availability_for(mms_ids)
    return {} if (ids = ensure_ids(mms_ids)).blank?

    cached_availability_for(ids).tap do |availability|
      cache_hit_ids = availability.keys
      logger.info("Availability for #{cache_hit_ids.size} IDs found in cache: #{cache_hit_ids.join(', ')}")

      fetched_availability = fetch_and_cache_availability_for(ids - cache_hit_ids)
      availability.merge!(fetched_availability)
    end
  end

  # ------------------------------------------------------------
  # Private methods

  private

  # @return  Rails.cache
  def cache
    @cache ||= ActiveSupport::Cache::MemoryStore.new(expires_in: CACHE_EXPIRY)
  end

  def clear_cache!
    @cache.clear if @cache
  end

  # @param mms_ids Array<String> a list of MMS IDs
  def cached_availability_for(mms_ids)
    mms_ids.filter_map do |id|
      cached_value = cache.read(id)
      [id, cached_value] unless cached_value.nil?
    end.to_h
  end

  # @param availability Hash<String, Boolean> a hash from MMS IDs to availability.
  def cache!(availability)
    cache.write_multi(availability)
  end

  # @param ids Array<String> a list of MMS IDs
  # @return Hash<String, Boolean> a hash from MMS IDs to availability.
  def fetch_and_cache_availability_for(ids)
    return {} if ids.blank?

    logger.info("Retrieving availability for #{ids.size} IDs: #{ids.join(', ')}")
    fetch_availability_for(ids).tap do |availability|
      cache!(availability)
    end
  end

  # @param ids Array<String> a list of MMS IDs
  # @return Hash<String, Boolean> a hash from MMS IDs to availability.
  def fetch_availability_for(ids)
    records = get_marc_records(*ids, max_records: (max_records || ids.size))

    # TODO: do we need to cache this?
    records.each_with_object({}) do |marc_record, availability|
      next unless (record_id = marc_record.record_id)

      ava_sf_e_values = marc_record.spec('AVA$e/#-#')
      logger.warn('MARC record does not have an AVA$e', MARC::XMLWriter.encode(marc_record)) if ava_sf_e_values.empty?
      availability[record_id] = ava_sf_e_values.include?('available')
    end
  rescue StandardError => e
    logger.warn(e)
    {}
  end

  # @param mms_ids Array<String> a list of MMS IDs
  # @return Array<String> a list of only those IDs that are valid
  def ensure_ids(mms_ids)
    return if mms_ids.blank?

    Array(mms_ids).compact.uniq.sort.filter_map do |id|
      # TODO: fewer String -> RecordId -> String conversions
      next unless (record_id = BerkeleyLibrary::Alma::RecordId.parse(id))

      # noinspection RubyMismatchedReturnType
      record_id.to_s
    end
  end
end
