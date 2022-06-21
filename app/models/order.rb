class Order < ApplicationRecord
  
  has_many :cart_item , dependent: :destroy
  belongs_to :order
  belongs_to :sweet
  
  enum status: { waiting_for_payment: 0, payment_confirmation: 1, in_production: 2, ready_to_ship: 3, shipped: 4 }
  
  
end
