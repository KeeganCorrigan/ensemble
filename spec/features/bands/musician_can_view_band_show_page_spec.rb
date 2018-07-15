require "rails_helper"

describe "a musician goes to band show page" do
  it "goes to the band show page" do
    musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
    band_1 = musician_1.bands.create(name:"pink floyd", genre:"rock", photo:"ioaodj")

    visit musician_band_path(musician_1, band_1)

    expect(page).to have_content(band_1.name)
    expect(page).to have_content(band_1.genre)
    expect(page).to have_content(musician_1.name)
  end

  it "can have multiple musicians in the band" do
    musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
    musician_2 = Musician.create!(name:"iuoij98h", username: "oaasdhas", instrument:"guitar", profile:"ouhauijasdui iuhiuhdsa uhiuhw19hsa", password:"1234")
    band_1 = musician_1.bands.create!(name:"pink floyd", genre:"rock", photo:"ioaodj")
    BandMusician.create!(band_id: band_1.id, musician_id: musician_2.id)

    visit musician_band_path(musician_2, band_1)

    expect(page).to have_content(band_1.name)
    expect(page).to have_content(band_1.genre)
    expect(page).to have_content(musician_1.name)
    expect(page).to have_content(musician_2.name)
  end

  it "can add a musician to the band" do
    musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
    musician_2 = Musician.create!(name:"iuoij98h", username: "oaasdhas", instrument:"guitar", profile:"ouhauijasdui iuhiuhdsa uhiuhw19hsa", password:"1234")
    band_1 = musician_1.bands.create!(name:"pink floyd", genre:"rock", photo:"ioaodj")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_2)

    visit musician_band_path(musician_1, band_1)

    expect(page).to_not have_content(musician_2.name)

    click_on "Join the band"

    expect(current_path).to eq(musician_band_path(musician_2, band_1))
    expect(page).to have_content("Welcome to the band")
    expect(page).to have_content("Create a song")
  end

  it "can not click on join band if it's already in band" do
    musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
    band_1 = musician_1.bands.create!(name:"pink floyd", genre:"rock", photo:"ioaodj")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_1)

    visit musician_band_path(musician_1, band_1)

    expect(page).to_not have_content("Join the band")
  end
end
