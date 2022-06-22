class Address < ApplicationRecord
  
  belongs_to :cunstomer
  
  def address_display
    '〒' + post_code + ' ' + address + ' ' + name
  end
end
