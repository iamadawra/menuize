class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    super
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    super
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    super
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    super
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    super
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    super
  end
end
