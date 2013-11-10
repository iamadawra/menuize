# == Schema Information
#
# Table name: owner_requests
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  restaurant_id   :integer
#  restaurant_name :string(255)
#  granted         :integer
#  granted_by      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class OwnerRequest < ActiveRecord::Base
  attr_accessible :granted, :granted_by, :restaurant_id, :restaurant_name, :user_id
  # :granted - integer either 1 or 0 for true or false
  # :granted_by - integer id of admin who approved or declined the request
  # :restaurant_id - integer
  # :restaurant_name - string(255)
  # :user_id - integer
end
