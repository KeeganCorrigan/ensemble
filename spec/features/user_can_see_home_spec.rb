require "rails_helper"

describe "an anonymous user visits home" do
  it "can click on login and and be taken to a login screen" do

    visit root_path

    click_on "login"

    expect(current_path).to eq(login_path)
  end
end
