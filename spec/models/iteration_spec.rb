require "rails_helper"

describe Iteration, type: :model do
  describe "validations" do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:recording) }
    it { should validate_presence_of(:comment) }
  end
  describe "relationships" do
    it { should belong_to(:musician) }
    it { should belong_to(:song) }
  end
end
