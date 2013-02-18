# coding: utf-8
require 'spec_helper'
include Warden::Test::Helpers

describe Admin::ItemsController do
  render_views

  let(:item) { create(:item) }
  let(:seo) { create(:seo) }
  let(:category) { create(:category) }
  let(:gallery) { create(:gallery) }
  before do
    login_as create(:admin_user)
  end
  describe "GET 'edit'" do
    it 'page(with gallery) should have content "Item was successfully updated"' do

      category
      item.galleries << gallery
      visit edit_admin_item_path(item)
      select(category.title, :from => 'item_category_id')
      find_field('Название')
      find_field('Описание')
      fill_in('Цена', :with => '32000')
      find_field('Материал')
      attach_file('Image', "#{Rails.root}/app/assets/images/rails.png")
      click_button('Update Item')

      page.should have_content("Item was successfully updated")
    end

    it 'page(without gallery) should have content "Item was successfully updated"' do

      category
      visit edit_admin_item_path(item)
      select(category.title, :from => 'item_category_id')
      find_field('Название')
      find_field('Описание')
      fill_in('Цена', :with => '32000')
      find_field('Материал')
      attach_file('Image', "#{Rails.root}/app/assets/images/rails.png")
      click_button('Update Item')

      page.should have_content("Item was successfully updated")
    end

    it 'page(with seo) should have content "Item was successfully updated"' do

      item.seo = seo
      category
      visit edit_admin_item_path(item)
      select(category.title, :from => 'item_category_id')
      find_field('Название')
      find_field('Описание')
      fill_in('Цена', :with => '32000')
      find_field('Материал')
      attach_file('Image', "#{Rails.root}/app/assets/images/rails.png")
      click_button('Update Item')

      page.should have_content("Item was successfully updated")
    end
  end

  describe "GET 'new'" do
    it 'page should have content "Item was successfully created"' do

      category
      visit new_admin_item_path
      select(category.title, :from => 'item_category_id')
      fill_in('Название', :with => 'двери с ручками')
      fill_in('Описание', :with => 'огромные двери')
      fill_in('Цена', :with => '32000')
      fill_in('Материал', :with => 'дерево')
      attach_file('Image', "#{Rails.root}/app/assets/images/rails.png")
      click_button('Create Item')

      page.should have_content("Item was successfully created")
    end
  end

  describe "GET 'show'" do
    it 'page should have content "Item Details"' do

      visit admin_item_path(item)

      page.should have_content("Item Details")
    end
  end
end