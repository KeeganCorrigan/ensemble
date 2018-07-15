require "rails_helper"


describe "a musician is in two bands" do
  it "goes to the musician band show page" do
    musician_1 = Musician.create!(name: "iuhasudh", username: "oauihdiuhas", instrument: "guitar", profile: "ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password: "1234")
    band_1 = musician_1.bands.create(name: "pijasodijasd", genre: "oiasdija", photo: "oiasdoij")
    band_2 = musician_1.bands.create(name: "pijasdasd", genre: "oiasdsa", photo: "oiasdads")
    musician_2 = Musician.create!(name: "iuhasdasdudh", username: "o12321s", instrument: "guitar", profile: "ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password: "1234")
    band_3 = musician_2.bands.create(name: "oijasiud", genre: "oasiud", photo: "iojasiojd")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_1)

    visit musician_path(musician_1)

    expect(page).to have_content(band_1.name)
    expect(page).to have_content(band_2.name)
    expect(page).to_not have_content(band_3.name)
  end
end
