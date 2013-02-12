require 'spec_helper'

describe Contact do
  describe "validates" do
    subject { create(:contact) }

    it { should validate_uniqueness_of(:content) }
    it { should validate_presence_of(:content) }
    its(:content) { should_not == TunedSanitize::for_(subject) }
  end
end