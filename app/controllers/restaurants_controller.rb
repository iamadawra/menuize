class RestaurantsController < ApplicationController
  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
    super
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @restaurant = Restaurant.find(params[:id])
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
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(params[:restaurant])
    if (params[:restaurant][:status] == "Exclusive")
      request = { :user_id => current_user.id, :granted => 0, :restaurant_id => @restaurant.id, :restaurant_name => @restaurant.name}
      OwnerRequest.create(request)
      @restaurant.mark_pending(current_user.id)
    end
    super
  end

  # PUT /restaurants/1
  # PUT /restaurants/1.json
  def update
    @restaurant = Restaurant.find(params[:id])
    authorize! :update, @restaurant
    if (params[:restaurant][:status] == "Exclusive")
      request = { :user_id => current_user.id, :granted => 0, :restaurant_id => @restaurant.id, :restaurant_name => @restaurant.name}
      OwnerRequest.create(request)
      @restaurant.mark_pending(current_user.id)
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
end
