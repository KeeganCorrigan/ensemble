class BandMusiciansController < ApplicationController
  def create
    BandMusician.create(band_id: params[:band_id], musician_id: params[:musician_id])
    redirect_to musician_band_path(Musician.find(params[:musician_id]), Band.find(params[:band_id]))
    flash[:success] = "Welcome to the band"
  end
end
