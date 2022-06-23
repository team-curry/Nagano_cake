class Customers::HomesController < ApplicationController
  layout "customers"
  
  def top
   @sweets = Sweet.order('id DESC').limit(4)
  end
  
  def about
    
  end
  
end
