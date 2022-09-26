class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/
  validates :postcode, presence: true, format: { with: VALID_POSTAL_CODE_REGEX  }
  validates :address, presence: true
  validates :shipping_name, presence: true

  enum payment_way: { credit_card: 0, transfer: 1 }
  enum status: { stand_by: 0, payment: 1, production: 2, preparation: 3, sent: 4 }

end
