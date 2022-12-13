class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.integer :unit_price
      t.integer :quantity
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
