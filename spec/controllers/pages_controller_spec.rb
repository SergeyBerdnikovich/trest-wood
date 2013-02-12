require 'spec_helper'

describe PagesController do
  before do
    create(:welcome)
  end

  describe "GET 'index'" do
    it "should be success" do
      get :welcome
      response.should be_success
    end
  end
end