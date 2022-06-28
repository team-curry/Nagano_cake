class CartItem < ApplicationRecord
  
  belongs_to :customer
  belongs_to :sweet
  
  def subtotal
      sweet.add_tax_price * quantity
  end
  
  def subtotalprice
      sweet.price * quantity
  end
  
end
