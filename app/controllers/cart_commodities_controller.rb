class CartCommoditiesController < ApplicationController
  before_action :set_cart

  def create
    cart_commodity = @cart.cart_commodities.build cart_commodity_params
    if cart_commodity.save
      redirect_to :back, notice: 'カートに投入しました。'
    else
      redirect_to :back, alert: 'カート投入に失敗しました。'
    end

  end

  private

  def set_cart
    @cart = Cart.active_cart current_user
  end

  def cart_commodity_params
    params.require(:cart_commodity).permit(:commodity_id, :quantity)
  end

end
