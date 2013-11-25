ActiveAdmin.register Restaurant do
  scope :pending_approval
  scope :collaborative
  scope :exclusive

  controller do
    def approve
      @request = OwnerRequest.find(params[:id])
      @request.approve
      super
    end

    def deny
      @request = OwnerRequest.find(params[:id])
      @request.deny
      super
    end
  end

  index do
  	column :name
  	column :status
  	column :owned_by
  	column :owner_name
  	column :created_at
  	column :updated_at
  	actions defaults: false do |restaurant|
      @restaurant = restaurant
      if @restaurant.owned_by && @restaurant.status != "Exclusive"
        link_to "Approve", restaurant_approve_path(@restaurant)
      end
    end
    actions defaults: false do |restaurant|
      @restaurant = restaurant
      if @restaurant.owned_by && @restaurant.status != "Exclusive"
        link_to "Deny", restaurant_deny_path(@restaurant)
      end
    end
  end
end

