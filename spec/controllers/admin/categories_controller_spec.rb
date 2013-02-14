# coding: utf-8
require 'spec_helper'
include Warden::Test::Helpers

describe Admin::CategoriesController do
  render_views

  let(:category) { create(:category) }
  let(:item) { create(:item) }
  let(:seo) { create(:seo) }
  before do
    login_as create(:admin_user)
  end
  describe "GET 'edit'" do
    it 'page(without seo) should have content "Category was successfully updated"' do

      visit edit_admin_category_path(category)
      fill_in('Название', :with => 'Krests')
      click_button('Update Category')

      page.should have_content("Category was successfully updated")
    end

    it 'page(with seo) should have content "Category was successfully updated"' do

      category.seo = seo
      visit edit_admin_category_path(category)
      fill_in('Название', :with => 'Doors')
      fill_in('Description', :with => 'goot doors')
      fill_in('Keywords', :with => 'doors, wood')
      click_button('Update Category')

      page.should have_content("Category was successfully updated")
    end
  end

  describe "GET 'new'" do
    it 'page should have content "Category was successfully created"' do

      visit new_admin_category_path
      fill_in('Название', :with => 'Doors')
      fill_in('Description', :with => 'goot doors')
      fill_in('Keywords', :with => 'doors, wood')
      click_button('Create Category')

      page.should have_content("Category was successfully created")
    end
  end

  describe "GET 'show'" do
    it 'page should have content "Category Details"' do

      category.items << item
      visit admin_category_path(category)

      page.should have_content("Category Details")
    end
  end
end