class IterationsController < ApplicationController
  def new
    @song = Song.find(params[:song_id])
    @iteration = Iteration.new
  end

  def create
    @song = Song.find(params[:song_id])
    @iteration = @song.iterations.new(iteration_params)
    @iteration.musician_id = current_user.id
    @iteration.author = current_user.name
    if @iteration.save
      redirect_to song_path(@song)
    end
  end

  def show
    @iteration = Iteration.find(params[:id])
  end

  def index
    @song = Song.find(params[:song_id])
    @iterations = @song.iterations.all
  end

  private

  def iteration_params
    params.require(:iteration).permit(:content, :recording, :comment)
  end
end
