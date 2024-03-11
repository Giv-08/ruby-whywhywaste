class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :cuisine
      t.string :location
      t.string :phone_no
      t.string :email
      t.integer :rating
      t.datetime :pickup_time

      t.timestamps
    end
  end
end
