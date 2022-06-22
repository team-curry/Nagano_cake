class Customers::SweetsController < ApplicationController
  layout "customers"
  
  def index
   @sweets = Sweet.page(params[:page]).per(8)
  end
  
  def show
   @sweet = Sweet.find(params[:id])
  end
  
end
