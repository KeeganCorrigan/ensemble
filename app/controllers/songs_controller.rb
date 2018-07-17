class SongsController < ApplicationController
  before_action :set_song, only: [:show, :destroy, :edit, :update]

  def new
    @song = Song.new
  end

  def create
    @band = Band.find(song_params[:band_id])
    @song = @band.songs.create(song_params)

    redirect_to song_path(@song)
  end

  def show
    @band = Band.find(@song.band_id)
    @iteration = Iteration.new
  end

  def destroy
    @band = Band.find(@song.band_id)
    @song.destroy

    redirect_to musician_band_path(current_user, @band)
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:timing, :genre, :title, :band_id)
  end
end
