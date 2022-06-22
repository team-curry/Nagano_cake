class Customers::OrdersController < ApplicationController
layout "customers"

    def new
      @order = Order.new
    end
  
    def create
      redirect_to action: :complete
    end
    
    def complete
      
    end
    
    def index
      
    end
    
  
end
