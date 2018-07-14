require "rails_helper"

describe BandMusician, type: :model do
  describe "relationships" do
    it {should belong_to(:band) }
    it {should belong_to(:musician) }
  end
end
