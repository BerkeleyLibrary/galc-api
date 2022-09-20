require 'csv'
require 'berkeley_library/logging'

class Importer

  ATTR_TO_HEADER = {
    image: 'Image',
    title: 'Title',
    artist: 'Artist',
    artist_url: 'ArtistURL',
    date: 'Date',
    description: 'Description',
    dimensions: 'Dimensions',
    series: 'Series',
    mms_id: 'MMSID',
    barcode: 'Barcode',
    circulation: 'Circulation',
    location: 'Location',
    value: 'Value',
    appraisal_date: 'AppraisalDate',
    notes: 'Notes',
    suppressed: 'Suppress'
  }.freeze

  attr_reader :data

  def initialize(data, validate_images: true)
    @data = data
    @validate_images = validate_images
  end

  def import_items!
    ActiveRecord::Base.transaction do
      factories.map { |factory| factory.create_item! }
    end
  end

  def factories
    @factories ||= csv.map { |csv_row| factory_from(csv_row) }
  end

  def image_errors
    @image_errors ||= factories.flat_map { |f| f.image_errors }
  end

  private

  def csv
    @csv = CSV.parse(data, headers: true).tap(&:by_row!)
  end

  def factory_from(csv_row)
    ItemFactory.new(csv_row, validate_images?)
  end

  def validate_images?
    @validate_images
  end

  class ItemFactory
    include BerkeleyLibrary::Logging

    HEADER_TO_ATTR = {
      'Image' => :image,
      'Thumbnail' => :thumbnail,
      'Title' => :title,
      'Artist' => :artist,
      'ArtistURL' => :artist_url,
      'Date' => :date,
      'Description' => :description,
      'Dimensions' => :dimensions,
      'Series' => :series,
      'MMSID' => :mms_id,
      'Barcode' => :barcode,
      'Circulation' => :circulation,
      'Location' => :location,
      'Value' => :value,
      'AppraisalDate' => :appraisal_date,
      'Notes' => :notes,
      'Suppress' => :suppressed
    }.freeze

    attr_reader :csv_row

    def initialize(csv_row, validate_images)
      @csv_row = csv_row
      @validate_images = validate_images

      csv_row.each { |header, raw_value| add_cell(header, raw_value) }
    end

    def attributes
      @attributes ||= {}
    end

    def facet_terms
      @facet_terms ||= {}
    end

    def create_item!
      ActiveRecord::Base.transaction do
        validate_images! if validate_images?
        Item.create!(attributes).tap { |item| item.terms = facet_terms.values.flatten }
      end
    rescue ActiveRecord::ActiveRecordError => e
      raise ArgumentError, "Unable to create record from attributes #{attributes.inspect}: #{e}"
    end

    def image_errors
      @image_errors ||= [].tap do |errors|
        %i[image thumbnail].each { |attr| validate_image(attr, errors) }
      end
    end

    private

    def validate_images?
      @validate_images
    end

    def terms_for(facet)
      facet_terms[facet] ||= []
    end

    def add_cell(header, raw_value)
      return unless raw_value

      if (attr = HEADER_TO_ATTR[header])
        add_attr(attr, raw_value)
      else
        add_facet_value(header, raw_value)
      end
    end

    def add_attr(attr, raw_value)
      raise ArgumentError, "#{attr} already set: #{attributes[attr]}" if attributes.key?(attr)

      attributes[attr] = clean_attr_value(attr, raw_value)
    end

    def add_facet_value(header, raw_value)
      return unless (facet = facet_for(header))

      terms_for(facet) << term_for(facet, raw_value)
    end

    def term_for(facet, raw_value)
      value = clean_facet_value(facet, raw_value).downcase
      facet.terms.find { |t| t.value.downcase == value }.tap do |term|
        raise ArgumentError, "No matching terms found for #{raw_value.inspect}, facet: #{facet.name}" unless term
      end
    end

    def facet_for(header)
      ItemFactory.all_facets.find { |f| header.start_with?(f.name) }
    end

    def clean_attr_value(attr, v)
      return (v == 'Yes') if attr == :suppressed
      return if v.nil?

      v.strip.presence
    end

    def clean_facet_value(facet, v)
      # TODO: better way to identify facets with sub-terms
      return v unless (facet.name == 'Medium') && (dash_index = v.rindex('-'))

      v[(dash_index + 1)..]
    end

    def validate_images!
      raise ArgumentError(image_errors.join('; ')) unless image_errors.empty?
    end

    def validate_image(attr, errors)
      if (basename = attributes[attr])
        image_uri = Item.image_uri_for(basename)
        http_status = BerkeleyLibrary::Util::URIs.head(image_uri)
        errors << "HEAD #{image_uri} returned #{http_status}" unless http_status == 200
      else
        errors << "Missing #{attr} for #{attributes[:title]}"
      end
    end

    class << self
      def all_facets
        @all_facets ||= Facet.includes(:terms).all
      end
    end
  end

end
