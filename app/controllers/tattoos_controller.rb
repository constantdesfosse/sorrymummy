class TattoosController < ApplicationController

  def index
    if params[:tag].present?
      @tattoos = Tattoo.tagged_with(params[:tag]).order(created_at: :desc)
    else
      @tattoos = Tattoo.all.order(created_at: :desc)
    end
  end

  def new
    @tattoo = Tattoo.new
  end
  def create
    @tattoo = Tattoo.new(tattoo_params.merge(user: current_user))
    if @tattoo.save
      redirect_to current_user
    else
      render :new
    end
  end
  def show
    @tattoo = Tattoo.find(params[:id])
  end

  def edit
    @tattoo = Tattoo.find(params[:id])
  end

  def update
    @tattoo = Tattoo.find(params[:id])
    @tattoo.update(tattoo_params)
    redirect_to current_user
  end

  def destroy
    @tattoo = Tattoo.find(params[:id])
    @tattoo.destroy
    redirect_to current_user
  end

  private

  def tattoo_params
    params.require(:tattoo).permit(:name, :category, :photo, :photo_cache, :description, :tag_list)
  end

end
