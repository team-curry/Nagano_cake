class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :create_name
  def create_name
    self.name = "#{last_name} #{first_name}"
  end

  validates :is_deleted, inclusion: { in: [true, false] }

  has_many :addresses
  has_many :cart_items
  has_many :orders


end
