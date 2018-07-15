class MusiciansController < ApplicationController

  def index
    @musicians = Musician.all
  end

  def new
    @musician = Musician.new
  end

  def create
    @musician = Musician.create(musician_params)
    redirect_to musician_path(@musician)
  end

  def show
    @musician = Musician.find(params[:id])
  end

  private

  def musician_params
    params.require(:musician).permit(:username, :name, :password, :profile, :instrument)
  end
end
