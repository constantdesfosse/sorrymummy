class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tattoos = Tattoo.where("user_id = ?", params[:id])
  end

  def index
      if  params[:q] == ""
        @users = User.all.where(provider: nil).order(created_at: :desc)
      elsif  params[:q] == nil
        @users = User.all.where(provider: nil).order(created_at: :desc)
      else
        @users = User.all.where(provider: nil).order(created_at: :desc).near(params[:q], 15)
      end


    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow link_to user_path(user)
    end
  end

end
