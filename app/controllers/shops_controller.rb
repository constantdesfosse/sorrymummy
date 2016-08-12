class ShopsController < ApplicationController

  def index
    @shops = Shop.all

    if  params[:q] == ""
        @shops = Shop.all.order(created_at: :desc)
      elsif  params[:q] == nil
        @shops = Shop.all.order(created_at: :desc)
      else
        @shops = Shop.all.order(created_at: :desc).near(params[:q], 15)
      end

    @hash = Gmaps4rails.build_markers(@shops) do |shop, marker|
        marker.lat shop.latitude
        marker.lng shop.longitude
        marker.infowindow shop.name
      end
  end

  def new
    @user = current_user
    if @user.shop != nil
      redirect_to root_path
    else
      @shop = Shop.new
    end
  end

  def create
    @shop = Shop.new(shop_params.merge(user: current_user))
    if @shop.save
      redirect_to shop_path(@shop)
    else
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    redirect_to shop_path
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to current_user
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :picture_profile, :address, :description, :picture_banner, :phone)
  end

end
