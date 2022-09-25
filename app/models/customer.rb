class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :address, presence: true
  validates :postcode, presence: true, length: {maximum: 7, minimum: 7}, numericality: true
  # VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/
  # validates :postcode, presence: true, format: { with: VALID_POSTAL_CODE_REGEX  }
  validates :telephone_number, presence: true, length: {maximum: 11, minimum: 10}, numericality: true
end
