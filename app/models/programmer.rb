class Programmer < ActiveRecord::Base
  def attributes_for_partial
    [:home_country, :quote, :claim_to_fame]
  end
end
