class CreateJoinTable < ActiveRecord::Migration
  def change
    create_table :categories_products do |t|
      # t.index [:_id, :_id]
      # t.index [:_id, :_id]
      t.belongs_to :category, index: true
      t.belongs_to :product, index: true
    end
  end
end
