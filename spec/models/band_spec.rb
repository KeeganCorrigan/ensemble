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

  describe "instance methods" do
    describe ".user_in_band?" do
      it "determines if a user is in a band" do
        musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
        band_1 = musician_1.bands.create!(name:"pink floyd", genre:"rock", photo:"ioaodj")
        musician_2 = Musician.create!(name:"iuhasasddh", username: "oa345has", instrument:"guitar", profile:"ou213213asiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")

        expect(band_1.user_in_band?(musician_1.id)).to eq(true)
        expect(band_1.user_in_band?(musician_2.id)).to eq(false)
      end
    end
    it "can display the owner of the band" do
      musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
      band_1 = musician_1.bands.create!(name:"pink floyd", genre:"rock", photo:"ioaodj")
      musician_2 = band_1.musicians.create!(name:"iuhasasddh", username: "oa345has", instrument:"guitar", profile:"ou213213asiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")

      expect(band_1.owner).to eq(musician_1)
    end
    it "can display the owner of the band for real" do
      musician_2 = Musician.create!(name:"iuhasasddh", username: "oa345has", instrument:"guitar", profile:"ou213213asiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
      musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
      band_1 = musician_1.bands.create!(name:"pink floyd", genre:"rock", photo:"ioaodj")
      BandMusician.create(band_id: band_1, musician_id: musician_2)

      expect(band_1.owner).to eq(musician_1)
    end
  end

  describe "class methods" do
    describe ".number_of_musicians" do
      it "returns total number of musician per band" do
        musician_2 = Musician.create!(name:"iuhasasddh", username: "oa345has", instrument:"guitar", profile:"ou213213asiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
        musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
        band_1 = musician_1.bands.create!(name:"pink floyd", genre:"rock", photo:"ioaodj")
        band_2 = musician_2.bands.create!(name:"purple makeup", genre:"rock", photo:"ioaodj")
        musician_3 = Musician.create!(name:"345345", username: "o1313", instrument:"guitar", profile:"ou213213asiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")

        BandMusician.create!(band_id: band_2.id, musician_id: musician_3.id)

        expected = { "pink floyd" => 1, "purple makeup" => 2 }

        expect(Band.number_of_musicians).to eq(expected)
      end
    end
  end
end
