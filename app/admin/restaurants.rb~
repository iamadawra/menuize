ActiveAdmin.register Restaurant do
  scope :pending_approval
  scope :collaborative
  scope :exclusive
  index do
  	column :name
  	column :status
  	column :owned_by
  	column :owner_name
  	column :created_at
  	column :updated_at
  	default_actions
  end

  action_item :only => :show do
    link_to('View on site', restaurants_path(restaurant))
  end
end
