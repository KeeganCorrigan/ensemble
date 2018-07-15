require "rails_helper"

describe Song, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:timing) }
    it { should validate_presence_of(:genre) }

  end
  describe "relationships" do
    it { should belong_to(:band) }
    it { should have_many(:iterations) }
  end
end
