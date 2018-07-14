class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user #type method names here to make helper methods visible to all other controllers

  def current_user
    @current_user = Musician.find_by(id: session[:musician_id])
  end

  def authorized?
    render file: "/public/404" unless current_user
  end
end
