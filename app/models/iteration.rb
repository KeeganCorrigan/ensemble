class Iteration < ApplicationRecord
  validates_presence_of :content,
                        :comment

  belongs_to :musician
  belongs_to :song

  def fix_drive_link
    recording.gsub("view?usp=sharing", 'preview')
  end
end
