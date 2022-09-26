class Genre < ApplicationRecord


  has_many :items, dependent: :destroy
  has_many :item_genres, dependent: :destroy
  validates :name, presence: true, length: {maximum: 20, minimum: 2}


end
