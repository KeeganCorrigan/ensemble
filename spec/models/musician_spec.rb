require "rails_helper"

describe Musician, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:profile) }
    it { should validate_presence_of(:instrument) }
  end
  describe "relationships" do
    it { should have_many(:band_musicians) }
    it { should have_many(:bands).through(:band_musicians)}
  end
end
