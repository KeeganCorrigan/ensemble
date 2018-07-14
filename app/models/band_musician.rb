class BandMusician < ApplicationRecord
  belongs_to :band
  belongs_to :musician
end
