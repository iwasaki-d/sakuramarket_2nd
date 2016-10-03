class Commodity < ActiveRecord::Base

  scope :view_commodities, -> { where(view_enabled: true).order(:position) }
end
