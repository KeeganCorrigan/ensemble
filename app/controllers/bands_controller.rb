class BandsController < ApplicationController
  before_action :set_musician, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :set_band, only: [:show, :edit, :update, :destroy]

  def new
    @musician = Musician.find(params[:musician_id])
    @band = Band.new
  end

  def create
    @musician = Musician.find(params[:musician_id])
    @band = @musician.bands.create(band_params)

    redirect_to musician_band_path(@musician, @band)
  end

  def edit
  end

  def update
    @band.update(band_params)
    if @band.save
      flash[:success] = "Profile updated!"
      redirect_to musician_band_path(@musician, @band)
    else
      flash.now[:alert] = @band.errors.full_messages.join("<br>").html_safe
      render :edit
    end
  end

  def destroy
    if current_user && @band.owner
      name = @band.name
      @band.destroy

      flash[:success] = "You broke up #{name}"
      
      redirect_to musician_path(current_user)
    end
  end

  def show
  end


  def index
    @bands = Band.all
  end

  private

  def set_musician
    @musician = Musician.find_by(id: params[:musician_id])
  end

  def set_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name, :photo, :genre)
  end
end
