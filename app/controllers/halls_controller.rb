class HallsController < ApplicationController
  def show
    @hall = Hall.find(params[:id])
    @tables = @hall.tables
  end
end
