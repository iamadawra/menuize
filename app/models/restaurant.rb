class Restaurant < ActiveRecord::Base
  attr_accessible :name, :status
  # Non accessible attributes: :owned_by, :owner_name, :restaurant_id
end
