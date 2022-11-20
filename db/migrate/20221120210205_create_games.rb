class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.date :publish_date
      t.decimal :price
      t.integer :stock

      t.timestamps
    end
  end
end
