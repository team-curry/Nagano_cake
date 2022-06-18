class CreateSweets < ActiveRecord::Migration[6.1]
  def change
    create_table :sweets do |t|
      t.integer :genre_id
      t.string :name
      t.text :explanation
      t.boolean :is_sale_status
      t.integer :price

      t.timestamps
    end
  end
end
