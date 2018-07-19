require "rails_helper"

describe "a musician creates a new band" do
  it "goes to the band show page" do
    musician_1 = Musician.create!(name: "iuhasudh", username: "oauihdiuhas", instrument: "guitar", profile: "ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password: "1234")

    visit new_musician_band_path(musician_1)

    name = "pink floyd"
    genre = "rock"
    photo = "here's a photo"

    fill_in :band_name, with: name
    fill_in :band_photo, with: photo
    fill_in :band_genre, with: genre

    click_on "Make the band"

    expect(current_path).to eq(musician_band_path(musician_1, Band.first))
    expect(page).to have_content(name)
    expect(page).to have_content(genre)
    expect(page).to have_content(musician_1.name)
  end

  describe "a musician can not create a band with the same name as another band" do
    it "goes to the band show page" do
      musician_2 = Musician.create!(name: "iuhasudh", username: "oaasnoins", instrument: "guitar", profile: "ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password: "1234")
      band_2 = musician_2.bands.create!(name: "pink floyd", genre: "oiroi", photo: "oijadjiolad")

      musician_1 = Musician.create!(name: "iuiojasd90h", username: "oauihdiuhas", instrument: "guitar", profile: "ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password: "1234")

      visit new_musician_band_path(musician_1)

      name = "pink floyd"
      genre = "rock"
      photo = "here's a photo"

      fill_in :band_name, with: name
      fill_in :band_photo, with: photo
      fill_in :band_genre, with: genre

      click_on "Make the band"

      expect(current_path).to eq(musician_bands_path(musician_1))
      expect(Band.count).to eq(1)
      expect(page).to have_content("Name has already been taken")
    end
  end
end
