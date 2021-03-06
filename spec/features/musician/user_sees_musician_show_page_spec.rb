require "rails_helper"

describe "a user visits their profile page" do
  it "clicks on edit and changes information" do
    musician_1 = Musician.create!(name: "iuhasudh", username: "oauihdiuhas", instrument: "guitar", profile: "ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password: "1234")
    band_1 = musician_1.bands.create(name: "pijasodijasd", genre: "oiasdija", photo: "oiasdoij")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_1)

    name = "billy"
    instrument = "piano"
    profile = "something else"

    visit musician_path(musician_1)

    click_on "edit"

    expect(current_path).to eq(edit_musician_path(musician_1))

    fill_in :musician_name, with: name
    fill_in :musician_instrument, with: instrument
    fill_in :musician_profile, with: profile

    click_on "Update profile"

    expect(current_path).to eq(musician_path(musician_1))

    expect(page).to have_content(name)
    expect(page).to have_content(instrument)
    expect(page).to have_content(profile)


    expect(page).to have_content("Profile updated!")

    expect(page).to_not have_content("iuhasudh")
  end

  it "clicks on edit and incorrectly fills out form" do
    musician_1 = Musician.create!(name: "iuhasudh", username: "oauihdiuhas", instrument: "guitar", profile: "ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password: "1234")
    band_1 = musician_1.bands.create(name: "pijasodijasd", genre: "oiasdija", photo: "oiasdoij")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_1)

    name = "billy"
    instrument = "piano"
    profile = "something else"

    visit musician_path(musician_1)

    click_on "edit"

    expect(current_path).to eq(edit_musician_path(musician_1))

    fill_in :musician_name, with: name
    fill_in :musician_instrument, with: instrument
    fill_in :musician_profile, with: ""

    click_on "Update profile"

    expect(current_path).to eq(musician_path(musician_1))

    expect(page).to have_content("Profile can't be blank")
  end

  it "visits a musicians page but is not that musician" do
    musician_1 = Musician.create!(name: "iuhasudh", username: "oauihdiuhas", instrument: "guitar", profile: "ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password: "1234")
    band_1 = musician_1.bands.create(name: "pijasodijasd", genre: "oiasdija", photo: "oiasdoij")

    musician_2 = Musician.create!(name: "oijasdi", username: "012n9odas", instrument: "pijgi", profile: "ioja0sjd", password: "021ioad")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_2)

    visit musician_path(musician_1)

    expect(page).to_not have_content("edit")
    expect(page).to_not have_content("delete")
  end

  it "can delete it's own account" do
    musician_1 = Musician.create!(name: "iuhasudh", username: "oauihdiuhas", instrument: "guitar", profile: "ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password: "1234")
    band_1 = musician_1.bands.create(name: "pijasodijasd", genre: "oiasdija", photo: "oiasdoij")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_1)

    visit musician_path(musician_1)

    click_on "delete"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("So long space cowboy")
  end

  it "can see a join bands link if it is not in any bands" do
    musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_1)

    visit musician_path(musician_1)

    click_on "Need a band?"

    expect(current_path).to eq(musician_bands_path(musician_1))
  end

  it "can click on my songs to go to a page of songs it has made" do
    musician_2 = Musician.create!(name:"iuhasudh", username: "oauifasd", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
    band_2 = musician_2.bands.create!(name:"pink", genre:"r9asdik", photo:"i981diadj")

    song_3 = band_2.songs.create!(title: "asdoijqw", timing: "asd0as8d8", genre: "ohue")

    musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
    band_1 = musician_1.bands.create!(name:"pink floyd", genre:"rock", photo:"ioaodj")

    song_1 = band_1.songs.create!(title: "iojoijqw", timing: "asdoad", genre: "ohuadsoia")

    song_2 = band_1.songs.create!(title: "iojijsa9idojjqw", timing: "0jasd0j", genre: "ohudisaj")


    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_1)

    visit musician_path(musician_1)

    click_on "My songs"

    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_2.title)

    expect(page).to_not have_content(song_3.title)
  end
end
