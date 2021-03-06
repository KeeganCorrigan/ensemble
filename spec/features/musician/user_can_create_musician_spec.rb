require "rails_helper"

describe "an anonymous user signs up as a musician" do
  it "clicks on signup link and goes to musician new path" do
    visit root_path

    click_on "signup"

    expect(current_path).to eq(new_musician_path)
  end

  it "fills in form and goes to musician show path" do
    visit new_musician_path

    fill_in :musician_name, with: "iuhasd"
    fill_in :musician_username, with: "oijasdj"
    fill_in :musician_instrument, with: "oiassd"
    fill_in :musician_profile, with: "oijasdiojaoisd"
    fill_in :musician_password, with: "i0j1320ejdsa"

    click_on "Start making music"

    musician_1 = Musician.first
    expect(current_path).to eq(musician_path(musician_1))
    expect(page).to have_content(musician_1.name)
    expect(page).to have_content(musician_1.instrument)
    expect(page).to have_content(musician_1.profile)
  end

  it "links to create a band page" do
    musician_1 = Musician.create!(name: "iuhasudh", username: "oauihdiuhas", instrument: "guitar", profile: "ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password: "1234")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(musician_1)

    visit musician_path(musician_1)

    within "#create-button" do
      click_on "Create a band"
    end

    expect(current_path).to eq(new_musician_band_path(musician_1))
  end
end
