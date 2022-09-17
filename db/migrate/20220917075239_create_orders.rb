class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.string :address
      t.string :postcode
      t.string :shipping_name
      t.integer :postage
      t.integer :total_amount
      t.integer :payment_way
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
