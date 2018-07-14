class BandsController < ApplicationController
  def new
    @musician = Musician.find(params[:musician_id])
    @band = Band.new
  end


end
