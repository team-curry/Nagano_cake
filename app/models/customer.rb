class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable






  has_many :addresses
  has_many :cart_items
  has_many :orders
  
  # def current_cart
  # cart_items || create_cart_items
  # end


end
