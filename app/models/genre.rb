class Genre < ApplicationRecord

  has_many :items, dependent: :destroy
  has_many :item_genres, dependent: :destroy

end
