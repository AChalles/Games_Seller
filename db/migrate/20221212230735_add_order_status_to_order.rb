class AddOrderStatusToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :order_status, null: false, foreign_key: true
  end
end
