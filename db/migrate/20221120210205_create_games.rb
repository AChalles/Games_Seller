class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.date :publish_date
      t.decimal :price
      t.integer :genre_id
      t.integer :platform_id
      t.integer :company_id
      t.timestamps
    end
  end
end
