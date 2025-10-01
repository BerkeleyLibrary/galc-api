class UpdateTermItemRelation < ActiveRecord::Migration[7.0]
  def up
    facet = Facet.find_by!(name: 'Decade')
    t_after_2019 = Term.find_by!(facet: facet, value: 'After 1999')
    
    new_terms = {
      (2000..2009) => Term.find_by!(facet: facet, value: '2000-2009'),
      (2010..2019) => Term.find_by!(facet: facet, value: '2010-2019'),
      (2020..)     => Term.find_by!(facet: facet, value: 'After 2020')
    }

    invalid_items = []

    t_after_2019.items.find_each do |item|
      year = integer_year(item.date)
      unless year
        invalid_items << { id: item.id, date: item.date }
        next
      end

      target_term = new_terms.find { |range, _| range.cover?(year) }&.last
      next unless target_term
        
      re_assign_term_to_item(item, t_after_2019, target_term)  
    end

    if invalid_items.any?
      Rails.logger.warn("Skipped #{invalid_items.size} items due to invalid or missing dates. Example: #{invalid_items.first(10).map { |i| "ID #{i[:id]}: '#{i[:date]}'" }.join(', ')}")
    end
  end

  def down
    facet = Facet.find_by!(name: 'Decade')
    target_term = Term.find_by!(facet: facet, value: 'After 1999')
    move_term_back_to_item(facet, target_term, '2000-2009')
    move_term_back_to_item(facet, target_term, '2010-2019')
    move_term_back_to_item(facet, target_term, 'After 2020')
  end

  private

  def integer_year(val)
    return nil if val.nil?

    # Try direct integer conversion
    begin
      return Integer(val)
    rescue ArgumentError, TypeError
      # Try to extract year from common date formats (e.g., "YYYY-MM-DD", "YYYY/MM/DD")
      if val.is_a?(String)
        if val =~ /\A(\d{4})[-\/]/
          return $1.to_i
        end
      end
    end
  end

  # Reassigns an item from the origin term to the target term, and removes the origin term from the item.
  def re_assign_term_to_item(item, origin_term, target_term)
    item.terms << target_term unless item.terms.include?(target_term)
    item.terms.delete(origin_term)
  end

  # Rolls back term assignment from origin_term_value to target_term for all items.
  def move_term_back_to_item(facet, target_term, origin_term_value)
    origin_term = Term.find_by!(facet: facet, value: origin_term_value)
    origin_term.items.find_each do |item|
      re_assign_term_to_item(item, origin_term, target_term)
    end
  end
end
