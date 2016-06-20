class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tattoos = Tattoo.where("user_id = ?", params[:id])
  end

  # def index
  #   @users = User.all.where(provider: nil).order(created_at: :desc)

  #   @hash = Gmaps4rails.build_markers(@users) do |user, marker|
  #     marker.lat user.latitude
  #     marker.lng user.longitude
  #     marker.infowindow user.first_name + " " + user.last_name
  #   end
  # end

  def index
      if  params[:q] == ""
        @users = User.all.where(provider: nil).order(created_at: :desc)
      else
        @users = User.all.where(provider: nil).order(created_at: :desc).near(params[:q], 20)
      end


    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.first_name + " " + user.last_name
    end
  end

end
