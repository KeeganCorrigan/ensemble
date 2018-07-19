require "rails_helper"

describe Song, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:timing) }
    it { should validate_presence_of(:genre) }

  end
  describe "relationships" do
    it { should belong_to(:band) }
    it { should have_many(:iterations) }
  end

  describe "class methods" do
    describe ".by_genre" do
      it "returns songs by genre" do
        musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
        band_1 = musician_1.bands.create(name:"pink floyd", genre:"rock", photo:"ioaodj")

        song_1 = band_1.songs.create(title: "poijasdioj", timing: "oijaiosdj", genre: "folk")
        song_2 = band_1.songs.create(title: "poijasdioj", timing: "oijaiosdj", genre: "folk")
        song_3 = band_1.songs.create(title: "poijasdioj", timing: "oijaiosdj", genre: "rock")
        song_4 = band_1.songs.create(title: "poijasdioj", timing: "oijaiosdj", genre: "jazz")

        expected = { "folk" => 2, "rock" => 1, "jazz" => 1 }

        expect(Song.by_genre).to eq(expected)
      end
    end
  end
end
