class AddDescriptionAndAddressAndCityAndZipAndCategoryToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :description, :string
    add_column :restaurants, :address, :string
    add_column :restaurants, :city, :string
    add_column :restaurants, :zip, :integer
    add_column :restaurants, :category, :string
  end
end
