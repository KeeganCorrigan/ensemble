require "rails_helper"

describe "a logged in user visits new song path" do
  it "can fill out a form and make a song" do
    musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
    band_1 = musician_1.bands.create(name:"pink floyd", genre:"rock", photo:"ioaodj")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_1)

    visit new_song_path

    title = "comfertably num"
    song_timing = "4/4"
    genre = "rock"

    fill_in :song_title, with: title
    fill_in :song_timing, with: song_timing
    fill_in :song_genre, with: genre
    find('#song_band_id').find(:xpath, 'option[1]').select_option

    click_on "Make the song"

    expect(current_path).to eq(song_path(Song.first))
    expect(page).to have_content(band_1.name)
    expect(page).to have_content(band_1.name)
    expect(page).to have_content(band_1.name)
  end

  it "can not create a song if it doesn't have a band" do
    musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
    band_1 = musician_1.bands.create(name:"pink floyd", genre:"rock", photo:"ioaodj")
    musician_2 = Musician.create(name:"iuasdaiojdh", username: "oauoasdjis", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_2)

    visit new_song_path

    expect(page).to_not have_content("title")
    expect(page).to_not have_content("timing")
    expect(page).to_not have_content("genre")
    expect(page).to_not have_content("Make the song")
    expect(page).to have_content("Create a band")
  end

  it "can redirect to update song form" do
    musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
    band_1 = musician_1.bands.create!(name:"pink floyd", genre:"rock", photo:"ioaodj")

    song_1 = band_1.songs.create!(title: "iojoijqw", timing: "asdoad", genre: "ohuadsoia")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_1)

    visit song_path(song_1)

    click_on "Update song"

    expect(current_path).to eq(edit_song_path(song_1))
  end

  it "can update song" do
    musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
    band_1 = musician_1.bands.create!(name:"pink floyd", genre:"rock", photo:"ioaodj")

    song_1 = band_1.songs.create!(title: "iojoijqw", timing: "asdoad", genre: "ohuadsoia")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_1)

    visit edit_song_path(song_1)

    title = "different song"
    song_timing = "3/4"
    genre = "blues"

    fill_in :song_title, with: title
    fill_in :song_timing, with: song_timing
    fill_in :song_genre, with: genre

    click_on "Update song"

    expect(current_path).to eq(song_path(song_1))

    expect(page).to have_content(title)
    expect(page).to have_content(song_timing)
    expect(page).to have_content(genre)

    expect(page).to_not have_content("iojoijqw")
  end

  it "can delete a song" do
    musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
    band_1 = musician_1.bands.create!(name:"pink floyd", genre:"rock", photo:"ioaodj")

    song_1 = band_1.songs.create!(title: "iojoijqw", timing: "asdoad", genre: "ohuadsoia")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_1)

    visit song_path(song_1)

    click_on "Trash song"

    expect(current_path).to eq(musician_band_path(musician_1, band_1))
    expect(Song.count).to eq(0)
  end

  it "can not delete or edit a song if it is not in the band" do
    musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
    band_1 = musician_1.bands.create!(name:"pink floyd", genre:"rock", photo:"ioaodj")
    musician_2 = Musician.create!(name: "oij982", username: "i1298hndosa", instrument: "iuadsuhi1", profile: "ji219h9onsdal", password: "892398hd")

    song_1 = band_1.songs.create!(title: "iojoijqw", timing: "asdoad", genre: "ohuadsoia")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_2)

    visit song_path(song_1)

    expect(page).to_not have_content("Trash song")
    expect(page).to_not have_content("Update song")
  end
end
