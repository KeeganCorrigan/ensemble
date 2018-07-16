class Iteration < ApplicationRecord
  validates_presence_of :content,
                        :recording,
                        :comment

  belongs_to :musician
  belongs_to :song
end
