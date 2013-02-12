# coding: utf-8
require 'spec_helper'
include Warden::Test::Helpers

describe Admin::WelcomesController do
  render_views

  let(:welcome) { create(:welcome) }
  before do
    login_as create(:admin_user)
  end
  describe "GET 'edit'" do
    it 'page should have content "Welcome was successfully updated"' do

      visit edit_admin_welcome_path(welcome)
      fill_in('Content', :with => '<h1>Кошка</h1>')
      click_button('Update Welcome')

      page.should have_content("Welcome was successfully updated")
    end
  end

  describe "GET 'new'" do
    it 'page should have content "Welcome was successfully created"' do

      visit new_admin_welcome_path
      fill_in('Content', :with => '<h1>Кошка</h1>')
      click_button('Create Welcome')

      page.should have_content("Welcome was successfully created")
    end
  end

  describe "GET 'show'" do
    it 'page should have content "Welcome Details"' do

      visit admin_welcome_path(welcome)

      page.should have_content("Welcome Details")
    end
  end

  describe "GET 'index'" do
    it 'page should have content "Welcome"' do

      welcome
      visit admin_welcomes_path

      page.should have_content("Welcome")
    end
  end
end