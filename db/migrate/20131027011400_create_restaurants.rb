class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :status
      t.integer :owned_by
      t.integer :restaurant_id
      t.string :owner_name

      t.timestamps
    end
  end
end
