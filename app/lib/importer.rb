require 'csv'

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

  def initialize(data)
    @data = data
  end

  def items
    @items = create_items!
  end

  private

  def csv
    @csv = CSV.parse(data, headers: true).tap(&:by_row!)
  end

  def create_items!
    ActiveRecord::Base.transaction do
      csv.map { |csv_row| create_item!(csv_row) }
    end
  end

  def create_item!(csv_row)
    attributes = attributes_from(csv_row)

    ActiveRecord::Base.transaction do
      Item.create!(attributes).tap do |item|
        item.terms = terms_from(csv_row)
      end
    end
  end

  def terms_from(csv_row)
    term_values_from(csv_row).each_with_object([]) do |(facet_name, term_values), tt|
      facet_terms = facet_terms_from(facet_name, term_values)
      facet_terms.each { |term| tt << term }
    end
  end

  def facet_terms_from(facet_name, term_values)
    facet = Facet.find_by!(name: facet_name)
    raw_terms = term_values.map { |term_value| find_term(facet, term_value) }
    parent_terms = raw_terms.map(&:parent).compact.uniq
    raw_terms - parent_terms
  end

  def term_values_from(csv_row)
    Facet.pluck(:name).each_with_object({}) do |facet_name, ft_values|
      next unless (raw_value = csv_row[facet_name])
      next unless (term_values = extract_values(facet_name, raw_value)).any?

      ft_values[facet_name] = term_values
    end
  end

  def attributes_from(csv_row)
    ATTR_TO_HEADER.each_with_object({}) do |(attr, header), attrs|
      next unless (value = clean_value(attr, csv_row[header]))

      attrs[attr] = value
    end
  end

  def extract_values(facet_name, raw_value)
    values = raw_value.split(',').map(&:strip)
    return values unless facet_name == 'Medium'

    # TODO: should we just strip parent values here?
    values.flat_map { |v| v.split('-') }
  end

  def find_term(facet, term_value)
    Term.find_by!('facet_id = ? AND LOWER(value) = ?', facet.id, term_value.downcase)
  rescue ActiveRecord::RecordNotFound => e
    e.message.sub!('$1', facet.id.inspect)
    e.message.sub!('$2', term_value.inspect)

    raise
  end

  def clean_value(attr, v)
    return (v == 'Yes') if attr == :suppressed
    return if v.nil?

    v.strip.presence
  end
end
