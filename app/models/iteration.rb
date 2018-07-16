class Iteration < ApplicationRecord
  validates_presence_of :content,
                        :recording,
                        :comment

  has_attached_file :clip

  belongs_to :musician
  belongs_to :song
end
