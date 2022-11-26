class CreatePastOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :past_orders do |t|
      t.date :order_placed
      t.date :order_processed
      t.date :order_shipped
      t.string :order_status
      t.decimal :sub_total
      t.decimal :order_total
      t.decimal :total_payed

      t.timestamps
    end
  end
end
