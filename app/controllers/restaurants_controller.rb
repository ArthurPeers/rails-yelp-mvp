class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
    # No need for app/views/restaurants/create.html.erb
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  def new
    @restaurant = Restaurant.new # Needed to instantiate the form_with
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to restaurants_path(@restaurant)
  end

  def destroy
    @restaurants = Restaurant.find(params[:id])
    @restaurants.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to restaurants_path(@restaurant), status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
