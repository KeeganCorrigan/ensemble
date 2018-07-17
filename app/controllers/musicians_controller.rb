class MusiciansController < ApplicationController
  before_action :set_musician, only: [:show, :edit, :destroy, :update]

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
  end

  def edit
  end

  def update
    @musician.update(musician_params)
    if @musician.save
      flash[:success] = "Profile updated!"
      redirect_to musician_path(@musician)
    else
      flash.now[:alert] = @musician.errors.full_messages.join("<br>").html_safe
      render :edit
    end
  end

  def destroy
    if @musician.id == current_user.id
      @musician.destroy
      flash[:success] = "So long space cowboy"

      redirect_to root_path
    end
  end

  private

  def musician_params
    params.require(:musician).permit(:username, :name, :password, :profile, :instrument)
  end

  def set_musician
    @musician = Musician.find(params[:id])
  end
end
