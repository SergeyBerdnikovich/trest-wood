# coding: utf-8
require 'spec_helper'
include Warden::Test::Helpers

describe Admin::ContactsController do
  render_views

  let(:contact) { create(:contact) }
  before do
    login_as create(:admin_user)
  end
  describe "GET 'edit'" do
    it 'page should have content "contact was successfully updated"' do

      visit edit_admin_contact_path(contact)
      fill_in('Content', :with => '<h1>Кошка</h1>')
      click_button('Update Contact')

      page.should have_content("Contact was successfully updated")
    end
  end

  describe "GET 'new'" do
    it 'page should have content "Contact was successfully created"' do

      visit new_admin_contact_path
      fill_in('Content', :with => '<h1>Кошка</h1>')
      click_button('Create Contact')

      page.should have_content("Contact was successfully created")
    end
  end

  describe "GET 'show'" do
    it 'page should have content "Contact Details"' do

      visit admin_contact_path(contact)

      page.should have_content("Contact Details")
    end
  end

  describe "GET 'index'" do
    it 'page should have content "Contact"' do

      contact
      visit admin_contacts_path

      page.should have_content("Contact")
    end
  end
end