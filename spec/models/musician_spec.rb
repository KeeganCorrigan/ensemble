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

  describe "roles" do
  it "can be created as an admin" do
    user = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234", role: 1)

    expect(user.role).to eq("admin")
    expect(user.admin?).to be_truthy
  end

  it "can be created as a default user" do
    user = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")

    expect(user.role).to eq("default")
    expect(user.default?).to be_truthy
  end
end
end
