class CreateProvinces < ActiveRecord::Migration[7.0]
  def change
    create_table :provinces do |t|
      t.string :name
      t.string :abbr
      t.decimal :pst
      t.decimal :hst
      t.decimal :gst

      t.timestamps
    end
  end
end
