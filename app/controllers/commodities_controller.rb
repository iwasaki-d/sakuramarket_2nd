class CommoditiesController < ApplicationController
  before_action :set_commodity

  def show
  end

  private

  def set_commodity
    @commodity = Commodity.find(params[:id])
  end
end
