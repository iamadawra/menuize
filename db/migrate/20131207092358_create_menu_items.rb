class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.integer :restaurant_id
      t.string :content
      t.integer :added_by

      t.timestamps
    end
  end
end
