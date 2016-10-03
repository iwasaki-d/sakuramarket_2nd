class CartCommodity < ActiveRecord::Base
  belongs_to :cart
  belongs_to :commodity

  validates :cart, presence: true
  validates :commodity, presence: true

  def calculate
    paid = commodity.price * self.quantity
    paid
  end

end
