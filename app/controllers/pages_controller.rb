class PagesController < ApplicationController
  def home
    @halls = Hall.all
  end
end
