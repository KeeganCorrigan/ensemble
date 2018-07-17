require "rails_helper"


describe "a band owner visits band page" do
  it "clicks on edit and fills out form" do
    musician_1 = Musician.create!(name: "iuhasudh", username: "oauihdiuhas", instrument: "guitar", profile: "ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password: "1234")
    band_1 = musician_1.bands.create(name: "pijasodijasd", genre: "oiasdija", photo: "oiasdoij")

    name = "oiadsio"
    genre = "9djiodsa"
    photo = "0192jionda"

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_1)

    visit musician_band_path(musician_1, band_1)

    click_on "edit"

    expect(current_path).to eq(edit_musician_band_path(musician_1, band_1))

    fill_in :band_name, with: name
    fill_in :band_genre, with: genre
    fill_in :band_photo, with: photo

    click_on "Update the band"

    expect(current_path).to eq(musician_band_path(musician_1, band_1))
    expect(page).to have_content(name)
    expect(page).to have_content(genre)

    expect(page).to_not have_content("pijasodijasd")
  end

  it "clicks on delete" do
    musician_1 = Musician.create!(name: "iuhasudh", username: "oauihdiuhas", instrument: "guitar", profile: "ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password: "1234")
    band_1 = musician_1.bands.create(name: "pijasodijasd", genre: "oiasdija", photo: "oiasdoij")

    name = "oiadsio"
    genre = "9djiodsa"
    photo = "0192jionda"

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_1)

    visit musician_band_path(musician_1, band_1)

    click_on "delete"

    expect(current_path).to eq(musician_path(musician_1))

    expect(Band.count).to eq(0)
  end
end
