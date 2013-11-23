class ImagesController < InheritedResources::Base
  def destroy
    image = Image.find(params[:id])
    restaurant = image.restaurant_id
    image.destroy
    redirect_to restaurant_path(restaurant)
  end
end
