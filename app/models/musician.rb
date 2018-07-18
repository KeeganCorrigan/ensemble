class Musician < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true, allow_nil: true
  validates_presence_of :name,
                        :profile,
                        :instrument

  enum role: ["default", "admin"]

  has_many :band_musicians, dependent: :destroy
  has_many :bands, through: :band_musicians

  def find_songs
    bands.inject([]) do |collector, band|
      band.songs.each do |song|
        collector << song
        collector
      end
    end
  end

end
