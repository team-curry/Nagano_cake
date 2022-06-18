class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :sweet_id
      t.integer :price
      t.integer :making_status
      t.integer :quantity
      
      t.timestamps
    end
  end
end
