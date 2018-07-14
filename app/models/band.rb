class Band < ApplicationRecord

  validates_presence_of :name,
                        :genre,
                        :photo

  has_many :band_musicians
  has_many :songs
  has_many :musicians, through: :band_musicians

end
