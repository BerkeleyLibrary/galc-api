class CreateFacetLookupView < ActiveRecord::Migration[7.0]
  def up
    view_stmt = <<~SQL.squish
      CREATE MATERIALIZED VIEW facet_lookup AS
        SELECT DISTINCT
               items.id AS item_id,
               facets.name AS facet_name,
               terms.value AS term_value,
               (terms.id = items_terms.term_id) AS direct
          FROM items
               INNER JOIN facets ON true
               INNER JOIN items_terms
                       ON items_terms.item_id = items.id
          LEFT OUTER JOIN terms AS children
                       ON children.facet_id = facets.id
                      AND children.id = items_terms.term_id
               INNER JOIN terms
                       ON terms.facet_id = facets.id
                      AND terms.id = items_terms.term_id
                       OR terms.id = children.parent_id
      ;
    SQL
    exec_query(view_stmt)

    index_stmt = <<~SQL.squish
      CREATE INDEX index_facet_lookup_on_facet_name_and_term_value 
                ON facet_lookup 
             USING btree (facet_name, term_value);
    SQL
    exec_query(index_stmt)

    function_stmt = <<~SQL.squish
      CREATE FUNCTION refresh_facet_lookup()
              RETURNS trigger
             LANGUAGE plpgsql
                   AS $$
                      BEGIN
                        REFRESH MATERIALIZED VIEW facet_lookup;
                        RETURN null;
                      END
                      $$;
    SQL
    exec_query(function_stmt)

    trigger_stmt_items_terms = <<~SQL.squish
      CREATE TRIGGER refresh_facet_lookup_for_items_terms
               AFTER INSERT OR UPDATE OR DELETE
                  ON items_terms
             EXECUTE FUNCTION refresh_facet_lookup();
    SQL
    exec_query(trigger_stmt_items_terms)

    trigger_stmt_facet_names = <<~SQL.squish
      CREATE TRIGGER refresh_facet_lookup_for_facets
               AFTER UPDATE
                  OF name
                  ON facets
             EXECUTE FUNCTION refresh_facet_lookup();
    SQL
    exec_query(trigger_stmt_facet_names)

    trigger_stmt_term_values = <<~SQL.squish
      CREATE TRIGGER refresh_facet_lookup_for_terms
               AFTER UPDATE
                  OF value
                  ON terms
             EXECUTE FUNCTION refresh_facet_lookup();
    SQL
    exec_query(trigger_stmt_term_values)

  end

  def down
    exec_query('DROP FUNCTION refresh_facet_lookup CASCADE')
    exec_query('DROP MATERIALIZED VIEW facet_lookup')
  end
end
