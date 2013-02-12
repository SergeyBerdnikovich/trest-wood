class ItemsController < ApplicationController
  def index
    category = Category.find(params[:category_id])
    @items = Item.for_category(category)
  end

  def show
    @item = Item.find(params[:id])
  end
end
