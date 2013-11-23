class RemoveShownFromImages < ActiveRecord::Migration
  def up
    remove_column :images, :shown
  end

  def down
    add_column :images, :shown, :boolean
  end
end
