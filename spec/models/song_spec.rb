require "rails_helper"

describe Song, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:timing) }
    it { should validate_presence_of(:genre) }
    it { should validate_presence_of(:status) }
  end
  describe "relationships" do
    it { should belong_to(:band) }
  end
end
