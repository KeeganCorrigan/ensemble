require "rails_helper"


describe "an anonymouse user visits home" do
  it "goes to the band index page" do
    musician_1 = Musician.create!(name: "iuhasudh", username: "oauihdiuhas", instrument: "guitar", profile: "ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password: "1234")
    band_1 = musician_1.bands.create(name: "pijasodijasd", genre: "oiasdija", photo: "oiasdoij")
    band_2 = musician_1.bands.create(name: "pijasdasd", genre: "oiasdsa", photo: "oiasdads")
    musician_2 = Musician.create!(name: "iuhasdasdudh", username: "o12321s", instrument: "guitar", profile: "ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password: "1234")
    band_3 = musician_2.bands.create(name: "oijasiud", genre: "oasiud", photo: "iojasiojd")

    visit root_path

    click_on "Find bands"

    expect(current_path).to eq(bands_path)

    expect(page).to have_content(band_1.name)
    expect(page).to have_content(band_2.name)
    expect(page).to have_content(band_3.name)
  end

  it "goes to the musician index page" do
    musician_1 = Musician.create(name: "Roger Waters", username: "Roger", password: "roger", profile: "amazing guitarist and song writer", instrument: "guitar and vocals")

    musician_2 = Musician.create(name: "Syd Barrett", username: "Syd", password: "syd", profile: "unfortunately, no longer with us", instrument: "guitars and vocal")

    musician_3 = Musician.create(name: "Nick Mason", username: "Nick", password: "nick", profile: "drummer in the 90's, played 90's drums.", instrument: "drums")

    visit root_path

    click_on "Find Musicians"

    expect(page).to have_content(musician_1.name)
    expect(page).to have_content(musician_2.name)
    expect(page).to have_content(musician_3.name)
  end
end
