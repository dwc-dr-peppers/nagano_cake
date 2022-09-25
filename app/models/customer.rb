class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  def full_name
    self.family_name + " " + self.first_name
  end

  def full_name_kana
    self.family_name_kana + " " + self.first_name_kana
  end


  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :address, presence: true
  VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/
  validates :postcode, presence: true, format: { with: VALID_POSTAL_CODE_REGEX  }
  validates :telephone_number, presence: true, length: {maximum: 11, minimum: 10}, numericality: true
end
