class UpdateTermItemRelation < ActiveRecord::Migration[7.0]
  def up
    facet = Facet.find_by!(name: 'Decade')
    old_term = Term.find_by!(facet: facet, value: 'After 1999')
    
    new_terms = {
      (2000..2009) => Term.find_by!(facet: facet, value: '2000-2009'),
      (2010..2019) => Term.find_by!(facet: facet, value: '2010-2019'),
      (2020..)     => Term.find_by!(facet: facet, value: 'After 2020')
    }

    old_term.items.find_each do |item|
      year = integer_year(item.date)
      next unless year

      target_term = new_terms.find { |range, _| range.cover?(year) }&.last
      next unless target_term
        
      update_item(item, old_term, target_term)  
    end    
  end

  def down
    facet = Facet.find_by!(name: 'Decade')
    target_term = Term.find_by!(facet: facet, value: 'After 1999')
    roll_back(facet, target_term, '2000-2009')
    roll_back(facet, target_term, '2010-2019')
    roll_back(facet, target_term, 'After 2020')
  end

  private
  
  def integer_year(val)
    Integer(val)
  rescue ArgumentError, TypeError
    nil
  end

  def update_item(item, origin_term, target_term)
    return unless target_term & item & target_term

    item.terms.delete(origin_term)
    item.terms << target_term unless item.terms.include?(target_term)
  end

  def roll_back(facet, target_term, origin_term_value)
    origin_term = Term.find_by!(facet: facet, value: origin_term_value)
    origin_term.items.find_each do |item|
      update_item(item, origin_term, target_term)
    end
  end
end
