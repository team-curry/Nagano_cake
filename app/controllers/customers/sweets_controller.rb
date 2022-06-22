class Customers::SweetsController < ApplicationController
  layout "customers"
  
  def index
   @sweets = Sweet.page(params[:page]).per(8)
  end
  
  def show
   @sweet = Sweet.find(params[:id])
  end
  
  private 
 
  def sweet_params
  params.require(:sweet).permit(:genre_id, :name, :explanation, :is_sale_status, :price, :image)
  end
end
