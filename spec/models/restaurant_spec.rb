# == Schema Information
#
# Table name: restaurants
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  status        :string(255)
#  owned_by      :integer
#  restaurant_id :integer
#  owner_name    :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  description   :string(255)
#  address       :string(255)
#  city          :string(255)
#  zip           :integer
#  category      :string(255)
#  menu          :string(255)
#  open_time     :integer
#  close_time    :integer
#

require 'spec_helper'

describe Restaurant do
  pending "add some examples to (or delete) #{__FILE__}"
end
