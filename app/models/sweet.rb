class Sweet < ApplicationRecord
 has_one_attached :image
 
 has_many :cart_items
 has_many :order_details

end
