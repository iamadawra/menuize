class RemoveOpenTimeAndCloseTimeFromRestaurants < ActiveRecord::Migration
  def up
    remove_column :restaurants, :open_time
    remove_column :restaurants, :close_time
  end

  def down
    add_column :restaurants, :close_time, :datetime
    add_column :restaurants, :open_time, :datetime
  end
end
