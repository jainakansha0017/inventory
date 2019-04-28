class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :quantity
      t.integer :sold_quantity
      t.decimal :price, precision: 64, scale: 12
      t.decimal :total_price, precision: 64, scale: 12
      t.decimal :sold_total_price, precision: 64, scale: 12
      t.string :status
      t.string :reason
      t.timestamps null: false
    end
  end
end
