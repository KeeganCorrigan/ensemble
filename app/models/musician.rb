class Musician < ApplicationRecord
  has_secure_password

  validates_presence_of :name,
                        :username,
                        :password_digest,
                        :profile,
                        :instrument

  has_many :band_musicians
  has_many :bands, through: :band_musicians
end
