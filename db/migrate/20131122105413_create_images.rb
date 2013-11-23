class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :restaurant_id
      t.integer :user_id
      t.boolean :shown

      t.timestamps
    end
  end
end
