class IterationsController < ApplicationController
  def new
    @song = Song.find(params[:song_id])
    @iteration = Iteration.new
  end

  def create
    @song = Song.find(params[:song_id])
    @iteration = @song.iterations.new(iteration_params)
    @iteration.musician_id = current_user.id
    @iteration.save

    redirect_to song_iteration_path(@song, @iteration)
  end

  def show
    @iteration = Iteration.find(params[:id])
  end

  private

  def iteration_params
    params.require(:iteration).permit(:content, :recording, :comment)
  end
end
