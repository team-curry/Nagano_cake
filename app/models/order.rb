class Order < ApplicationRecord
  
  has_many :order_detail
  belongs_to :customer
  
  has_many :cart_item , dependent: :destroy
  enum status: { waiting_for_payment: 0, payment_confirmation: 1, in_production: 2, ready_to_ship: 3, shipped: 4 }
  enum payment_method: { credit: 0, bank: 1}
  
end
