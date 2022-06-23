class Order < ApplicationRecord
  
  has_many :order_details
  belongs_to :customer
  
  has_many :cart_item , dependent: :destroy
  enum status: { waiting_for_payment: 0, payment_confirmation: 1, in_production: 2, ready_to_ship: 3, shipped: 4 }
  enum payment_method: { credit: 0, bank: 1 }
  
    after_update do
    if self.status == "payment_confirmation"
      self.order_details.each {|order_detail|
      order_detail.update(making_status: "payment_confirmation")
      }
    end
  end
  
end
