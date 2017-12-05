class TablesController < ApplicationController
  before_action :set_hall

  def create
    @hall.tables.create

    redirect_to @hall
  end

  def show
    @table = @hall.tables.find(params[:id])
  end

  def destroy
    @hall.tables.destroy(params[:id])
    redirect_to @hall
  end

  def book
    @hall.tables.find(params[:table_id]).book

    redirect_to @hall
  end

  def release
    @hall.tables.find(params[:table_id]).release

    redirect_to @hall
  end

  private

  def set_hall
    @hall = Hall.find(params[:hall_id])
  end
end
