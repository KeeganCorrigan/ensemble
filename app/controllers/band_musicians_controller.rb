class BandMusiciansController < ApplicationController
  def create
    @band = Band.find(params[:band_id])

    if @band.user_in_band?(params[:musician_id]) == false
      BandMusician.create(band_id: @band.id, musician_id: params[:musician_id])
      redirect_to musician_band_path(Musician.find(params[:musician_id]), Band.find(params[:band_id]))
      flash[:success] = "Welcome to the band"
    end
  end

  def destroy
    @band = Band.find(params[:band_id])
    band_name = @band.name

    if @band.user_in_band?(params[:musician_id])
      BandMusician.find_by(band_id: @band.id, musician_id: params[:musician_id]).destroy

      redirect_to root_path

      flash[:success] = "You left #{band_name}"
    end
  end
end
