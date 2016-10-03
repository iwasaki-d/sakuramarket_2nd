class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :user, index: true
      t.string :shipping_addr
      t.string :shipping_postal_code
      t.string :shipping_address
      t.string :shipping_name
      t.integer :shipping_fee, null: false, default: 0
      t.integer :settlement_fee, null: false, default: 0
      t.integer :commodities_fee, null: false, default: 0
      t.integer :commodities_paid, null: false, default: 0
      t.integer :total_amount_paid, null: false, default: 0
      t.boolean :ordered, null: false, default: false

      t.timestamps null: false
    end
  end
end
