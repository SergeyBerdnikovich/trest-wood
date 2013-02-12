# coding: utf-8
require 'spec_helper'
include Warden::Test::Helpers

describe Admin::GalleriesController do
  render_views

  let(:gallery) { create(:gallery) }
  let(:item) { create(:item) }
  before do
    login_as create(:admin_user)
  end
  describe "GET 'edit'" do
    it 'page should have content "Gallery was successfully updated"' do

      item
      visit edit_admin_gallery_path(gallery)
      select(item.title, :from => 'gallery_item_id')
      attach_file('Image', "#{Rails.root}/app/assets/images/rails.png")
      click_button('Update Gallery')

      page.should have_content("Gallery was successfully updated")
    end
  end

  describe "GET 'new'" do
    it 'page should have content "Gallery was successfully created"' do

      item
      visit new_admin_gallery_path
      select(item.title, :from => 'gallery_item_id')
      attach_file('Image', "#{Rails.root}/app/assets/images/rails.png")
      click_button('Create Gallery')

      page.should have_content("Gallery was successfully created")
    end
  end

  describe "GET 'show'" do
    it 'page should have content "Gallery #1"' do

      visit admin_gallery_path(gallery)

      page.should have_content("Gallery ##{gallery.id}")
    end
  end

  describe "GET 'index'" do
    it 'page should have content "Galleries"' do

      gallery
      visit admin_galleries_path

      page.should have_content("Galleries")
    end
  end
end