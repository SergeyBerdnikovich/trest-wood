require 'spec_helper'

describe Item do
  describe "validates" do
    subject { create(:item) }

    it { should validate_presence_of(:category_id) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:title) }
    it { should ensure_length_of(:title).is_at_least(2).is_at_most(50) }
    it { should ensure_length_of(:description).is_at_least(2).is_at_most(50) }
    it { should ensure_length_of(:material).is_at_least(2).is_at_most(50) }
    its(:cost) { should be > 0 and should be < 9_999_999_999 }
    it { should belong_to(:category) }
    it { should have_many(:galleries) }
    it { should accept_nested_attributes_for(:galleries) }
  end
end