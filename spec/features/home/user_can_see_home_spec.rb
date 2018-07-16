require "rails_helper"

describe "an anonymous user visits home" do
  it "can click on login and and be taken to a login screen" do

    visit root_path

    click_on "login"

    expect(current_path).to eq(login_path)
  end

  it "fills out account creation form correctly and clicks create" do
    name = "within"
    username = "username"
    instrument = "guitar"
    profile = "stuff"
    password = "within"

    visit root_path

    click_on "signup"

    expect(current_path).to eq(new_musician_path)

    fill_in :musician_name, with: name
    fill_in :musician_username, with: username
    fill_in :musician_instrument, with: instrument
    fill_in :musician_profile, with: profile
    fill_in :musician_password, with: password

    click_on "Start making music"

    expect(current_path).to eq(musician_path(Musician.first))
    expect(page).to_not have_content("login")
  end

  it "uses an already in use username" do
    name = "within"
    username = "username"
    instrument = "guitar"
    profile = "stuff"
    password = "within"

    Musician.create!(name: name, username: username, instrument: instrument, profile: profile, password: password)

    visit root_path

    click_on "signup"

    expect(current_path).to eq(new_musician_path)

    fill_in :musician_name, with: name
    fill_in :musician_username, with: username
    fill_in :musician_instrument, with: instrument
    fill_in :musician_profile, with: profile
    fill_in :musician_password, with: password

    click_on "Start making music"

    expect(current_path).to eq(musicians_path)
    expect(page).to have_content("Username has already been taken")
    expect(Musician.count).to eq(1)
  end

  it "fills out account creation form incorrectly and clicks create" do
    name = "bill"
    username = "username"
    instrument = "guitar"
    profile = "stuff"
    password = "within"

    visit root_path

    click_on "signup"

    expect(current_path).to eq(new_musician_path)

    fill_in :musician_name, with: name
    fill_in :musician_username, with: username
    fill_in :musician_instrument, with: instrument
    fill_in :musician_profile, with: profile

    click_on "Start making music"

    expect(current_path).to eq(musicians_path)
    expect(page).to have_content("Password can't be blank")
    expect(Musician.count).to eq(0)
  end
end
