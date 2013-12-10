class RestaurantsController < ApplicationController

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.search(params[:search], params[:searchZip]).paginate(:per_page => 5, :page => params[:page]).find_with_reputation(:votes, :all, order: "votes desc")
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @restaurant = Restaurant.find(params[:id])
    if (@restaurant.images.length != 0)
      @image_header = @restaurant.images[0].file.url(:medium)
    else
      @image_header = "/assets/missing.png"
    end
  end

  # GET /restaurants/new
  # GET /restaurants/new.json
  def new
    @restaurant = Restaurant.new
    3.times { @restaurant.menu_items.build }
  end

  # GET /restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
    authorize! :edit, @restaurant
    if (@restaurant.menu_items.nil? || @restaurant.menu_items.length == 0)
      3.times { @restaurant.menu_items.build }
    end
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    return if check_if_exists(params[:restaurant][:name])
    set_params
    @restaurant = Restaurant.new(params[:restaurant])
    @restaurant.save
    if (params[:restaurant][:status] == "Exclusive")
      send_request
      @restaurant.mark_pending(current_user.id)
    end
    set_menu_items_and_file
    super
  end

  # PUT /restaurants/1
  # PUT /restaurants/1.json
  def update
    set_params
    @restaurant = Restaurant.find(params[:id])
    authorize! :update, @restaurant
    if (params[:restaurant][:status] == "Exclusive" &&
        @restaurant.owned_by != current_user.id)
      params[:restaurant][:status] = "Pending Approval"
      send_request
      @restaurant.mark_pending(current_user.id)
    end
    MenuItem.destroy_all(:restaurant_id => params[:id])
    set_menu_items_and_file
    super
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant = Restaurant.find(params[:id])
    authorize! :destroy, @restaurant
    @restaurant.destroy
    super
  end

  # PUT /restaurants/1/approve
  def approve
    approve_or_deny(true)
  end

  # PUT /restaurants/1/deny
  def deny
    approve_or_deny(false)
  end

  def vote
    value = params[:type] == "Like" ? 1 : -1
    @restaurant = Restaurant.find(params[:id])
    @restaurant.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank You! Your vote has been registered."
  end

  private
  def set_params
    param_to_instance_var(:file)
    param_to_instance_var(:menu_items_attributes)
  end

  private
  def set_menu_items_and_file
    if !(@file.nil?)
      Image.create({ :restaurant_id => @restaurant.id, :file => @file, :user_id => current_user.id})
    end
    if !(@menu_items_attributes.nil?)
      @menu_items_attributes.each do |key, value|
        if !(value["content"].blank?)
          MenuItem.create({ :restaurant_id => @restaurant.id, :added_by => current_user.id, :content => value["content"]})
        end
      end
    end
  end

  private
  def param_to_instance_var(symbol)
    if !(params[:restaurant][symbol].nil?)
      eval %Q{ @#{symbol.to_s} = params[:restaurant][symbol] }
      params[:restaurant].delete(symbol)
    end
  end

  private
  def send_request
    request = { :user_id => current_user.id, :granted => 0, :restaurant_id => @restaurant.id, :restaurant_name => @restaurant.name}
    OwnerRequest.create(request)
    UserMailer.access_request(current_user, @restaurant).deliver
  end

  private
  def approve_or_deny(approve)
    @restaurant = Restaurant.find(params[:id])
    if @restaurant
      @req = (OwnerRequest.find_by_restaurant_id(@restaurant.id))
      if (approve)
        @req.approve
      else
        @req.deny
      end
    end
    redirect_to(request.env["HTTP_REFERER"])
  end

  private
  def check_if_exists(name)
    if !(Restaurant.find_by_name(name).nil? &&
         Restaurant.find_by_name(name.capitalize).nil?)
      flash[:notice] = "A restaurant with this name already exists."
      redirect_to(new_restaurant_path) and return true
    end
  end
end
