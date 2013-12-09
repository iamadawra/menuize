# == Schema Information
#
# Table name: menu_items
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  content       :string(255)
#  added_by      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe MenuItem do
  pending "add some examples to (or delete) #{__FILE__}"
end
