require "rails_helper"

describe "a logged in user in the band makes a song" do
  it "creates a new iteration" do
    musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
    band_1 = musician_1.bands.create!(name:"pink floyd", genre:"rock", photo:"ioaodj")

    song_1 = band_1.songs.create!(title: "iojoijqw", timing: "asdoad", genre: "ohuadsoia")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_1)

    visit song_path(song_1)

    click_on "New version"

    expect(current_path).to eq(new_song_iteration_path(song_1))
  end

  it "fills out form for a new iteration" do
    musician_1 = Musician.create!(name:"iuhasudh", username: "oauihdiuhas", instrument:"guitar", profile:"ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password:"1234")
    band_1 = musician_1.bands.create!(name:"pink floyd", genre:"rock", photo:"ioaodj")

    song_1 = band_1.songs.create!(title: "iojoijqw", timing: "asdoad", genre: "ohuadsoia")

    content = "oijasdij"
    recording = "ij298soa"
    comment = "ij2189noisda"

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_1)

    visit new_song_path(song_1)

    fill_in :iteration_content, with: content
    fill_in :iteration_recording, with: recording
    fill_in :iteration_comment, with: comment

    click_on "Create iteration"

    expect(current_path).to eq(song_path(song_1))

    expect(page).to have_content(content)
    expect(page).to have_content(recording)
    expect(page).to have_content(comment)
  end
end
