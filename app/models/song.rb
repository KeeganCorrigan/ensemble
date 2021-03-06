class Song < ApplicationRecord
  validates_presence_of :title,
                        :timing,
                        :genre

  belongs_to :band
  has_many :iterations, dependent: :destroy

  def self.by_genre
    group(:genre).count
  end

end
