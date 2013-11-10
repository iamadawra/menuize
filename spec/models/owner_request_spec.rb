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

require 'spec_helper'

describe OwnerRequest do
  pending "add some examples to (or delete) #{__FILE__}"
end
