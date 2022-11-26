class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.text :user_bio
      t.string :profile_pic
      t.integer :account_type
      t.string :favourite_game
      t.string :favourite_genre

      t.timestamps
    end
  end
end
