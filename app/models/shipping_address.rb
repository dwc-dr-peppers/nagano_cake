class ShippingAddress < ApplicationRecord

  belongs_to :customer

  VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/
  validates :postcode, presence: true, format: { with: VALID_POSTAL_CODE_REGEX  }
  validates :address, presence: true
  validates :name, presence: true

end
