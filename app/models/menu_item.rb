class MenuItem < ActiveRecord::Base
  # added_by - integer id of the user who added the item
  # content - string text for the menu item
  # restaurant_id - integer id of the restaurant that this item belongs to
  attr_accessible :added_by, :content, :restaurant_id
  belongs_to :restaurant
end
