require "rails_helper"

describe Band, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:photo) }
    it { should validate_presence_of(:genre) }
  end
  describe "relationships" do
    it {should have_many(:band_musicians) }
    it {should have_many(:musicians).through(:band_musicians) }
    it {should have_many(:songs) }
  end
end
