# Ensure migration can run without error even if we delete/rename the models
(class Facet < ActiveRecord::Base; end) unless defined?(Facet)

class RenameColorsFacet < ActiveRecord::Migration[7.0]

  FROM_NAME, TO_NAME = %w[Colors Appearance]
  
  def up
    return unless (facet = Facet.find_by(name: FROM_NAME))

    facet.update!(name: TO_NAME)
  end
  
  def down
    return unless (facet = Facet.find_by(name: TO_NAME))

    facet.update!(name: FROM_NAME)
  end
end
