class Band < ApplicationRecord

  validates_presence_of :name,
                        :genre,
                        :photo

  has_many :band_musicians, dependent: :destroy
  has_many :songs, dependent: :destroy
  has_many :musicians, through: :band_musicians

  def user_in_band?(id)
    musicians.where(id: id).exists?
  end

  def owner
    musicians.first
  end
end
