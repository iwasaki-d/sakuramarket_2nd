class CreateCommodities < ActiveRecord::Migration
  def change
    create_table :commodities do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :description
      t.decimal :position, null: false
      t.boolean :view_enabled, null: false, default: false

      t.timestamps null: false
    end
  end
end
