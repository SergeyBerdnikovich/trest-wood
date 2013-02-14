# coding: utf-8
require 'spec_helper'
include Warden::Test::Helpers

describe Admin::SeosController do
  render_views

  let(:item) { create(:item) }
  let(:category) { create(:category) }
  let(:seo) { create(:seo) }
  before do
    login_as create(:admin_user)
  end
  describe "GET 'edit'" do
    it 'page(select item) should have content "Seo was successfully updated"' do

      create(:item, :title => 'Krest')
      visit edit_admin_seo_path(seo)
      find_field('Description')
      fill_in('Keywords', :with => 'doors, wood')
      select('Krest', :from => 'item_id')
      click_button('Update Seo')

      page.should have_content("Seo was successfully updated")
    end
    it 'page(select category) should have content "Seo was successfully updated"' do

      create(:category, :title => 'Krests')
      visit edit_admin_seo_path(seo)
      fill_in('Description', :with => 'door')
      fill_in('Keywords', :with => 'doors, wood')
      select('Krests', :from => 'category_id')
      click_button('Update Seo')

      page.should have_content("Seo was successfully updated")
    end
    it 'page(select none) should have content "Seos"(redirect_to admin_seo_path(seo))' do

      visit edit_admin_seo_path(seo)
      fill_in('Description', :with => 'door')
      fill_in('Keywords', :with => 'doors, wood')
      click_button('Update Seo')

      current_path.should == admin_seo_path(seo)
    end
  end

  describe "GET 'new'" do
    it 'page(select item) should have content "Seo was successfully created"' do

      create(:item, :title => 'Krest')
      visit new_admin_seo_path
      fill_in('Description', :with => 'door')
      fill_in('Keywords', :with => 'doors, wood')
      select('Krest', :from => 'item_id')
      click_button('Create Seo')

      page.should have_content("Seo was successfully created")
    end
    it 'page(select category) should have content "Seo was successfully created"' do

      create(:category, :title => 'Krests')
      visit new_admin_seo_path
      fill_in('Description', :with => 'door')
      fill_in('Keywords', :with => 'doors, wood')
      select('Krests', :from => 'category_id')
      click_button('Create Seo')

      page.should have_content("Seo was successfully created")
    end
    it 'page(select none) should have content "Seos"(redirect_to admin_seos_path)' do

      visit new_admin_seo_path
      fill_in('Description', :with => 'door')
      fill_in('Keywords', :with => 'doors, wood')
      click_button('Create Seo')

      current_path.should == admin_seos_path
    end
  end

  describe "GET 'index'" do
    it 'page should have content "Seos"' do

      item.seo = seo
      visit admin_seos_path

      page.should have_content("Seos")
    end
  end
end