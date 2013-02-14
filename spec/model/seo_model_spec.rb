require 'spec_helper'

describe Seo do
  let(:item) { create(:item) }
  let(:welcome) { create(:welcome) }
  let(:seo) { create(:seo) }
  describe "get keywords" do
    it "seo for item not found, returned item title" do
      Seo.get_keywords_for(item).should == item.title
    end
    it "seo for item found, returned item.seo keywords" do
      item.seo = seo
      Seo.get_keywords_for(item).should == item.seo.keywords
    end
    it "seo for welcome not found, returned 'welcome'" do
      Seo.get_keywords_for_welcome(welcome).should == 'Welcome'
    end
    it "seo for welcome found, returned welcome.seo keywords" do
      welcome.seo = seo
      Seo.get_keywords_for_welcome(welcome).should == welcome.seo.keywords
    end
  end
  describe "get description" do
    it "seo for item not found, returned item title" do
      Seo.get_description_for(item).should == item.title
    end
    it "seo for item found, returned item.seo description" do
      item.seo = seo
      Seo.get_description_for(item).should == item.seo.description
    end
    it "seo for welcome not found, returned 'welcome'" do
      Seo.get_description_for_welcome(welcome).should == 'Welcome'
    end
    it "seo for welcome found, returned welcome.seo description" do
      welcome.seo = seo
      Seo.get_description_for_welcome(welcome).should == welcome.seo.description
    end
  end
end