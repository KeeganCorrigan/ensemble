require "rails_helper"

describe Iteration, type: :model do
  describe "validations" do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:recording) }
    it { should validate_presence_of(:comment) }
  end
  describe "relationships" do
    it { should belong_to(:musician) }
    it { should belong_to(:song) }
  end

  describe "instance methods" do
    describe ".fix_drive_link" do
      it "adjusts google drive sharing link to work with iframe player" do
        musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
        band_1 = musician_1.bands.create!(name:"pink floyd", genre:"rock", photo:"ioaodj")

        song_1 = band_1.songs.create!(title: "iojoijqw", timing: "asdoad", genre: "ohuadsoia")

        iteration_1 = song_1.iterations.create!(content: "oijadi", comment: "oijaidsj", recording: "https://drive.google.com/file/d/0BympaFShsfT-S0pjdF9PVk9PNDQ/view?usp=sharing", musician_id: musician_1.id)

        expect(iteration_1.fix_drive_link).to eq("https://drive.google.com/file/d/0BympaFShsfT-S0pjdF9PVk9PNDQ/preview")
      end
    end
  end
end
