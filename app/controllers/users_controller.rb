class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tattoos = Tattoo.where("user_id = ?", params[:id])
  end

  def index
    @users = User.all.where(provider: nil).order(created_at: :desc)

    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow "Visit"
    end
  end

end
