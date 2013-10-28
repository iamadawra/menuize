class AddOpenTimeAndCloseTimeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :open_time, :datetime
    add_column :restaurants, :close_time, :datetime
  end
end
