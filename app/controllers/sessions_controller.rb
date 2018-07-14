class SessionsController < ApplicationController

  def new

  end

  def create
    @musician = Musician.find_by(username: params[:session][:username])
    if @musician && @musician.authenticate(params[:session][:password])
      session[:musician_id] = @musician.id
      redirect_to musicians_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
