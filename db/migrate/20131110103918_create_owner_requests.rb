class CreateOwnerRequests < ActiveRecord::Migration
  def change
    create_table :owner_requests do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.string :restaurant_name
      t.integer :granted
      t.integer :granted_by

      t.timestamps
    end
  end
end
