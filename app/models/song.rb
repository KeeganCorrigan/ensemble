class Song < ApplicationRecord
  validates_presence_of :title,
                        :timing,
                        :genre,
                        :status

  belongs_to :band

end
