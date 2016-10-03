class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.references :cart, index: true
      t.date :ordered_at, null: false

      t.timestamps null: false
    end
  end
end
