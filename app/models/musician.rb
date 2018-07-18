class Musician < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true, allow_nil: true
  validates_presence_of :name,
                        :profile,
                        :instrument

  has_many :band_musicians, dependent: :destroy
  has_many :bands, through: :band_musicians

end
