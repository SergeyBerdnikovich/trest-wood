require 'spec_helper'

describe Welcome do
  describe "validates" do
    subject { create(:welcome) }

    it { should validate_uniqueness_of(:content) }
    it { should validate_presence_of(:content) }
    its(:content) { should_not == TunedSanitize::for_(subject) }
  end
end