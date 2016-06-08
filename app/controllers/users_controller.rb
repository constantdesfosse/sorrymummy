class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tattoos = Tattoo.where("user_id = ?", params[:id])
  end

  def index
    @users = User.all
  end

end
