class Admins::SweetsController < ApplicationController
    layout "admins"
    
 def new
  @sweet = Sweet.new
  @genres = Genre.all
 end
 
 def create
  @sweet = Sweet.new(sweet_params)
  @sweet.save
  redirect_to admins_sweet_path(@sweet.id)
 end
 
 def show
  @sweet = Sweet.find(params[:id])
  @genre = @sweet.genre
 end
 
 private
 
 def sweet_params
  params.require(:sweet).permit(:genre_id, :name, :explanation, :is_sale_status, :price, :image)
 end
end
