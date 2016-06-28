class ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
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
