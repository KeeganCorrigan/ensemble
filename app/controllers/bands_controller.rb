class BandsController < ApplicationController
  before_action :set_musician, only: [:new, :create, :show]
  before_action :set_band, only: [:show]

  def new
    @musician = Musician.find(params[:musician_id])
    @band = Band.new
  end

  def create
    @musician = Musician.find(params[:musician_id])
    @band = @musician.bands.create(band_params)

    redirect_to musician_band_path(@musician, @band)
  end

  def show

  end

  private

  def set_musician
    @musician = Musician.find(params[:musician_id])
  end

  def set_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name, :photo, :genre)
  end
end
