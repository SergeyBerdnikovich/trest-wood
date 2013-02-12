class PagesController < ApplicationController
  def welcome
    @welcome = Welcome.last
  end
end
