class HomeController < ApplicationController
  def index
    @commodities = Commodity.view_commodities
  end
end
