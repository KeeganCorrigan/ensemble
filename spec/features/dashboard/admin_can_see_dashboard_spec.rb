require "rails_helper"

describe "user visits dashboard" do
  context "as admin" do
    it "displays graphs" do
      admin = Musician.create!(name: "iuhasudh", username: "oauihdiuhas", instrument: "guitar", profile: "ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password: "1234", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path

      expect(page).to have_content("Dashboard")
    end
  end

  context "as user" do
    it "does not allow default to see graphs" do
      user = Musician.create!(name: "iuhasudh", username: "oauihdiuhas", instrument: "guitar", profile: "ouhaudhasiuhui iuhiuhdsa uhiuhw19hsa", password: "1234", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_dashboard_path

      expect(page).to_not have_content("Dashboard")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
