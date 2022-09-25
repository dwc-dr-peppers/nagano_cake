class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum make_status: { not_start: 0, wait_production: 1, in_production: 2, completion: 3 }


end
