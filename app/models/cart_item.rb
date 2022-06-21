class CartItem < ApplicationRecord
  
belongs_to :customer
belongs_to :sweet

def sum_price
  sweet.taxin_price*quantity
end
  
end
