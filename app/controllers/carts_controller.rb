class CartsController < ApplicationController
  before_action :set_cart, only: %i(show edit update destroy calculate order)

  def show
  end

  def edit
  end

  def update
    if @cart.update(cart_params)
      redirect_to calculate_cart_path
    else
      render :edit
    end
  end

  def calculate
    if @cart.calculate
      render :confirm
    else
      redirect_to edit_cart_path, alert: '商品金額の計算に失敗しました。'
    end
  end

  def order
    unless @cart.do_order
      redirect_to @cart, alert: '注文処理に失敗しました。'
    end

    # //ここはカートモデルに移す
    order = @cart.order.build(user: current_user, ordered_at: Time.now)
    if order.save
      redirect_to @cart, notice: '注文を確定しました。'
    else
      @cart.update(ordered: false)
      redirect_to edit_cart_path, alert: '商品金額の計算に失敗しました。'
    end
  end


  def destroy
    @cart.destroy
    redirect_to carts_url, notice: 'Cart was successfully destroyed.'
  end

  private
  def set_cart
    @cart = Cart.active_cart current_user
  end

  def cart_params
    params.require(:cart).permit(:shipping_address, :shipping_postal_code, :shipping_email, :shipping_name)
  end
end
