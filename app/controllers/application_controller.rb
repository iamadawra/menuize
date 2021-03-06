class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def index
    self.common
  end
  def common
    instance_variable = instance_variable_get("@#{controller_name.singularize}")
    respond_to do |format|
      format.html # index.html
      format.json { render json: instance_variable }
    end
  end
  def show
    self.common
  end
  def new
    self.common
  end
  def create
    instance_variable = instance_variable_get("@#{controller_name.singularize}")
    respond_to do |format|
      if instance_variable.save
        format.html { redirect_to instance_variable, notice: 'Entry was successfully created.' }
        format.json { render json: instance_variable, status: :created, location: instance_variable }
      else
        format.html { render action: "new" }
        format.json { render json: instance_variable.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    instance_variable = instance_variable_get("@#{controller_name.singularize}")
    respond_to do |format|
      if instance_variable.update_attributes(params[controller_name.singularize.to_sym])
        format.html { redirect_to instance_variable, notice: 'Entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: instance_variable.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    instance_variable = instance_variable_get("@#{controller_name.singularize}")
    respond_to do |format|
      format.html { redirect_to "/#{controller_name}" }
      format.json { head :no_content }
    end
  end

  #plugin protection
  is_cancan=true
  begin
    Kernel.const_get('CanCan')
  rescue
    is_cancan=false
  end
  if is_cancan
    rescue_from CanCan::AccessDenied do |exception|
      flash[:error] = 'You are not authorized to update this page.'
      redirect_to restaurants_path
    end
  end

  protected

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
end
