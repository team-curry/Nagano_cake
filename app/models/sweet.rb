class Sweet < ApplicationRecord
 has_one_attached :image
 
 has_many :cart_items
 has_many :order_details
 belongs_to :genre 
 
 validates :is_sale_status, inclusion: { in: [true, false] }
 validates :image, presence: true
 validates :name, presence: true
 validates :explanation, presence: true
 validates :price, presence: true
 
 
 def add_tax_price
  (self.price * 1.10).round
 end

end
