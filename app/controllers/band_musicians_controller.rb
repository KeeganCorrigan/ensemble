class BandMusiciansController < ApplicationController
  def create
    @band = Band.find(params[:band_id])
    
    if @band.user_in_band?(params[:musician_id]) == false
      BandMusician.create(band_id: @band.id, musician_id: params[:musician_id])
      redirect_to musician_band_path(Musician.find(params[:musician_id]), Band.find(params[:band_id]))
      flash[:success] = "Welcome to the band"
    end
  end
end
