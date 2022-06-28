class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :post_code
      t.text :addresses
      t.string :name
      t.integer :status
      t.integer :total_payment
      t.integer :fee
      t.integer :payment_method
      
      t.timestamps
    end
  end
end
