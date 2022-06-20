class CartItem < ApplicationRecord
  
belongs_to :order
belongs_to :sweet

def sum_price
  sweet.taxin_price*quantity
end
  
end
