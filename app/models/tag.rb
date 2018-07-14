class Tag < ApplicationRecord
  validates_presence_of :title

  has_many :song_tags
  has_many :songs, through: :song_tags

end
