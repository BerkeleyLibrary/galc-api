# Update terms of the three items whose value is nil or not in date or year format
class UpdateFixTermItemRelation < ActiveRecord::Migration[7.0]
  def up
    facet = Facet.find_by!(name: 'Decade')
    t_after_1999 = Term.find_by!(facet: facet, value: 'After 1999')
    t2000_2009 = Term.find_by!(facet: facet, value: '2000-2009')
    t2020_plus = Term.find_by!(facet: facet, value: 'After 2020')

    # Items with nil date
    update_item_term(t_after_1999.id, t2000_2009.id, "i.date is null AND i.title in ('Loading a Cannon', 'Dense Populations')")
    # Items with date = '[2020]'
    update_item_term(t_after_1999.id, t2020_plus.id, "date = '[2020]'")
  end

  def down
    facet = Facet.find_by!(name: 'Decade')
    t_after_1999 = Term.find_by!(facet: facet, value: 'After 1999')
    t2000_2009 = Term.find_by!(facet: facet, value: '2000-2009')
    t2020_plus = Term.find_by!(facet: facet, value: 'After 2020')

    # revert items with nil date
    update_item_term(t2000_2009.id,t_after_1999.id, "i.date is null AND i.title in ('Loading a Cannon', 'Dense Populations')")
    # revert items with date = '[2020]'
    update_item_term(t2020_plus.id, t_after_1999.id, "date = '[2020]'")
  end

  private

  def update_item_term(old_term_id, new_term_id, condition_sql)

    execute <<~SQL.squish
      WITH target AS (
        SELECT it.term_id, it.item_id
        FROM items i
        JOIN items_terms it ON i.id = it.item_id
        JOIN terms t ON it.term_id = t.id
        WHERE t.id = #{old_term_id}
          AND  #{condition_sql}
      )
      UPDATE items_terms it
      SET term_id = #{new_term_id}
      FROM target
      WHERE it.item_id = target.item_id
      AND it.term_id = target.term_id;
    SQL
  end
end
