class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true

  def with_tax_price
    #税込価格を求めるメソッド
    (price * 1.1).floor
  end

end
