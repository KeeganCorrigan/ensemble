require "rails_helper"


describe "an anonymouse user visits home" do
  it "goes to the band index page" do
    musician_1 = Musician.create!(name: "iuhasudh", username: "oauihdiuhas", instrument: "guitar", profile: "ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password: "1234")
    band_1 = musician_1.bands.create(name: "pijasodijasd", genre: "oiasdija", photo: "oiasdoij")
    band_2 = musician_1.bands.create(name: "pijasdasd", genre: "oiasdsa", photo: "oiasdads")
    musician_2 = Musician.create!(name: "iuhasdasdudh", username: "o12321s", instrument: "guitar", profile: "ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password: "1234")
    band_3 = musician_2.bands.create(name: "oijasiud", genre: "oasiud", photo: "iojasiojd")

    visit root_path

    expect(page).to_not have_content("Find bands")
    expect(page).to_not have_content("Find songs")
    expect(page).to_not have_content("Find musicians")
  end
end
