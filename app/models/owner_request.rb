class OwnerRequest < ActiveRecord::Base
  attr_accessible :granted, :granted_by, :restaurant_id, :restaurant_name, :user_id
  # :granted - integer either 1 or 0 for true or false
  # :granted_by - integer id of admin who approved or declined the request
  # :restaurant_id - integer
  # :restaurant_name - string(255)
  # :user_id - integer
end
