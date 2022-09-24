class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { stand_by: 0, payment: 1, production: 2, preparation: 3, sent: 4 }

end
