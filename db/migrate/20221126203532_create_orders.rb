class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.date :order_placed
      t.date :order_processed
      t.date :order_shipped
      t.string :order_status
      t.integer :sub_total
      t.integer :order_total
      t.integer :total_payed

      t.timestamps
    end
  end
end
