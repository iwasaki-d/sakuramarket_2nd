class AddShippingEmailToCarts < ActiveRecord::Migration
  def change
    add_column(:carts, :shipping_email, :string)
  end
end
