class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_commodities, dependent: :destroy
  has_one :order

  validates :user, presence: true

  def self.active_cart(user)
    cart = user.carts.find_or_initialize_by(ordered: false)
    cart.save if cart.new_record?
    cart
  end

  def calculate
    self.total_amount_paid = cart_commodities(0) { |sum, item| sum + item.calculate }
    self.save
  end

  def do_order
    self.ordered = true
    self.save
  end

end
