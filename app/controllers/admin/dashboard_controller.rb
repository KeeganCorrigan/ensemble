class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
    @musicians_per_band = Band.number_of_musicians
    @songs_by_genre = Song.by_genre
  end

  private

  def require_admin
    render file:'public/404' unless current_admin?
  end

end
