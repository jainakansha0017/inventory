class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :order, index: true
      t.string :drug_name
      t.integer :quantity
      t.decimal :price, precision: 64, scale: 12
      t.timestamps null: false
    end
  end
end
