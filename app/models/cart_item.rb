class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  validates :quantitiy, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }

  def subtotal
    #小計を求めるメソッド
    item.with_tax_price * quantitiy
  end

end
