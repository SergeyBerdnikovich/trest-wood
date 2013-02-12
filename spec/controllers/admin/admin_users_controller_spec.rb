# coding: utf-8
require 'spec_helper'
include Warden::Test::Helpers

describe Admin::AdminUsersController do
  render_views

  let(:user) { create(:admin_user) }
  before do
    login_as create(:admin_user, :email => 'admin@example.com', :password => 'password')
  end
  describe "GET 'edit'" do
    it 'page should have content "Admin user was successfully updated"' do

      visit edit_admin_admin_user_path(user)
      fill_in('Email', :with => 'asdasd@ad.as')
      find('#admin_user_password').set '12345678'
      fill_in('Password confirmation', :with => '12345678')
      click_button('Update Admin user')

      page.should have_content("Admin user was successfully updated")
    end
  end

  describe "GET 'new'" do
    it 'page should have content "Admin user was successfully created"' do

      visit new_admin_admin_user_path
      fill_in('Email', :with => 'asdasd@ad.as')
      fill_in('Password*', :with => '12345678')
      fill_in('Password confirmation', :with => '12345678')
      click_button('Create Admin user')

      page.should have_content("Admin user was successfully created")
    end
  end

  describe "GET 'index'" do
    it 'page should have content "Admin Users"' do

      visit admin_admin_users_path

      page.should have_content("Admin Users")
    end
  end

  describe "DELETE 'destroy'" do
    it "should destroy a admin user" do

     visit admin_admin_user_path(user)

     expect { click_link('Delete') }.to change(AdminUser, :count).by(-1)
    end
  end
end