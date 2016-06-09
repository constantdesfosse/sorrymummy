class TattoosController < ApplicationController

  def index
    @tattoos = Tattoos.all
  end

  def new
    @tattoo = Tattoo.new
  end
  def create
    @tattoo = Tattoo.new(tattoo_params)
    @tattoo.user_id = current_user.id
    if @tattoo.save
      redirect_to tattoo_path(@tattoo)
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
    redirect_to tattoo_path(@tattoo)
  end

  def destroy
    @tattoo = Tattoo.find(params[:id])
    @tattoo.destroy
    redirect_to :back
  end

  def index
    @tattoos = Tattoo.all
  end

  private

  def tattoo_params
    params.require(:tattoo).permit(:name, :photo, :photo_cache, :description)
  end

end
