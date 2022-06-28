class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :sweet
   enum making_status: { not_startable: 0, waiting_for_production: 1, in_production: 2, production_completed: 3 }

  after_update do
    order_details = self.order.order_details
    if order_details.any? {|order_detail| order_detail.making_status == "in_production"} == true
      self.order.update(status: "in_production") 
    elsif order_details.all? {|order_detail| order_detail.making_status == "production_completed"} == true 
    self.order.update(status: "ready_to_ship") 
    end
  end
 

end
