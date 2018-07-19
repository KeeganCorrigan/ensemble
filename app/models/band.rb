class Band < ApplicationRecord

  validates_presence_of :genre,
                        :photo,
                        :name

  validates :name, uniqueness: true, presence: true

  has_many :band_musicians, dependent: :destroy
  has_many :songs, dependent: :destroy
  has_many :musicians, through: :band_musicians

  def user_in_band?(id)
    musicians.where(id: id).exists?
  end

  def owner
    musicians.first
  end

  def self.number_of_musicians
    joins(:musicians).group("name").count
  end
end
