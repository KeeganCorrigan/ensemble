class MusiciansController < ApplicationController

  def index
    @musicians = Musician.all
  end

  def new
    @musician = Musician.new
  end

  def create
    @musician = Musician.new(musician_params)
    if @musician.save
      session[:musician_id] = @musician.id
      redirect_to musician_path(@musician)
    else
      flash.now[:alert] = @musician.errors.full_messages.join("<br>").html_safe
      render :new
    end
  end

  def show
    @musician = Musician.find(params[:id])
  end

  private

  def musician_params
    params.require(:musician).permit(:username, :name, :password, :profile, :instrument)
  end
end
