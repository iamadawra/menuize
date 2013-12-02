class RestaurantsController < ApplicationController

  can_edit_on_the_spot

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.search(params[:search], params[:searchZip]).paginate(:per_page => 5, :page => params[:page]).find_with_reputation(:votes, :all, order: "votes desc")
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @restaurant = Restaurant.find(params[:id])
    @images = Image.find_all_by_restaurant_id(params[:id]) || {}
    if (@images.length != 0)
      @image_header = @images[0].file.url(:thumb)
    else
      @image_header = "/assets/missing.png"
    end
    menu = @restaurant.menu
    @menu = menu.split(',').map(&:strip) if !(menu.nil?)
    super
  end

  # GET /restaurants/new
  # GET /restaurants/new.json
  def new
    @restaurant = Restaurant.new
    super
  end

  # GET /restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
    authorize! :edit, @restaurant
    @images = Image.find_all_by_restaurant_id(params[:id])
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    if !(params[:restaurant][:file].nil?)
      file = params[:restaurant][:file]
      params[:restaurant].delete(:file)
    end
    @restaurant = Restaurant.new(params[:restaurant])
    @restaurant.save
    if (params[:restaurant][:status] == "Exclusive")
      request = { :user_id => current_user.id, :granted => 0, :restaurant_id => @restaurant.id, :restaurant_name => @restaurant.name}
      OwnerRequest.create(request)
      UserMailer.access_request(current_user, @restaurant).deliver
      @restaurant.mark_pending(current_user.id)
    end
    if !(file.nil?)
      Image.create({ :restaurant_id => @restaurant.id, :file => file, :user_id => current_user.id})
    end
    super
  end

  # PUT /restaurants/1
  # PUT /restaurants/1.json
  def update
    @restaurant = Restaurant.find(params[:id])
    authorize! :update, @restaurant
    if !(params[:restaurant][:file].nil?)
      file = params[:restaurant][:file]
      params[:restaurant].delete(:file)
    end
    if (params[:restaurant][:status] == "Exclusive" && @restaurant.owned_by != current_user.id)
      request = { :user_id => current_user.id, :granted => 0, :restaurant_id => @restaurant.id, :restaurant_name => @restaurant.name}
      OwnerRequest.create(request)
      params[:restaurant][:status] = "Pending Approval"
      UserMailer.access_request(current_user, @restaurant).deliver
      @restaurant.mark_pending(current_user.id)
    end
    if !(file.nil?)
      Image.create({ :restaurant_id => @restaurant.id, :file => file, :user_id => current_user.id})
    end
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
    @restaurant = Restaurant.find(params[:id])
    if @restaurant
      @req = (OwnerRequest.find_by_restaurant_id(@restaurant.id))
      @req.approve
      redirect_to(request.env["HTTP_REFERER"])
    end
  end

  # PUT /restaurants/1/deny
  def deny
    @restaurant = Restaurant.find(params[:id])
    if @restaurant
      @req = (OwnerRequest.find_by_restaurant_id(@restaurant.id))
      @req.deny
      redirect_to(request.env["HTTP_REFERER"])
    end
  end

  def vote
    value = params[:type] == "Like" ? 1 : -1
    @restaurant = Restaurant.find(params[:id])
    @restaurant.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank You! Your vote has been registered."
  end
end
