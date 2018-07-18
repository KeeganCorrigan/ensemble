require "rails_helper"

describe "a user visits song index" do
  it "sees a list of songs" do
    musician_1 = Musician.create!(name: "iuhasudh", username: "oauihdiuhas", instrument: "guitar", profile: "ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password: "1234")
    band_1 = musician_1.bands.create(name: "pijasodijasd", genre: "oiasdija", photo: "oiasdoij")
    song_1 = band_1.songs.create!(title: "fakeadqw", timing: "fakwqee", genre: "fakesd")
    song_2 = band_1.songs.create!(title: "fakasdaw", timing: "fasdade", genre: "fasdsad2d")

    visit songs_path

    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_1.genre)
    expect(page).to have_content(song_2.title)
    expect(page).to have_content(song_2.genre)
  end
end
