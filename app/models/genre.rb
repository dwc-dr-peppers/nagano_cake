class Genre < ApplicationRecord

  has_many :items
  
  validates :name, presence: true, length: {maximum: 20, minimum: 2}

end
