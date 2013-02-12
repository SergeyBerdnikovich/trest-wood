require 'spec_helper'

describe ItemsController do
  before do
    create(:category)
    create(:item)
  end

  describe "GET 'index'" do
    it "should be success" do
      get :index, { :category_id => 1 }
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be success" do
      get :show, { :category_id => 1, :id => 1 }
      response.should be_success
    end
  end
end