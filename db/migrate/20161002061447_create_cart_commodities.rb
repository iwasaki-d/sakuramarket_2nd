class CreateCartCommodities < ActiveRecord::Migration
  def change
    create_table :cart_commodities do |t|
      t.references :cart, index: true
      t.references :commodity, index: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
