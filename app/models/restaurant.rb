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

class Restaurant < ActiveRecord::Base
  attr_accessible :name, :status, :open_time, :close_time, :address, :city, :zip, :description, :menu, :owned_by
  # Non accessible attributes: :owner_name, :restaurant_id
  scope :collaborative, where(:status=>"Collaborative")
  scope :exclusive, where(:status=>"Exclusive")
  scope :pending_approval, where(:status=>"Pending Approval")

  def mark_pending(id)
    self.status = "Pending Approval"
    self.owned_by = id
    self.save
  end

  def self.search(search)
  if search
    where('name LIKE ?', "%#{search}%")
  else
    scoped
  end
end


end
