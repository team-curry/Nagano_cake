class Genre < ApplicationRecord
    
has_many :sweets

validates :name, presence: true

end
