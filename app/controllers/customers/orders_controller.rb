class Customers::OrdersController < ApplicationController
layout "customers"
  
  def index
    
  end
  
  def create
    redirect_to action: :complete
  end
  
  def complete
    
  end
  
end
