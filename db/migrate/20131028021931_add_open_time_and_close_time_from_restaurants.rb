class AddOpenTimeAndCloseTimeFromRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :open_time, :integer
    add_column :restaurants, :close_time, :integer
  end
end
