class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_menu

  def init_menu
    @categories = Category.all
    @contact = Contact.last
  end
end
