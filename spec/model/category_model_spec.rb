require 'spec_helper'

describe Category do
  describe "validates" do
    subject { create(:category) }

    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should ensure_length_of(:title).is_at_least(2).is_at_most(50) }
    it { should have_many(:items) }
  end
end