class ListsController < ApplicationController
  require 'uri'
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.create(list_params)
    @list.save
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:name, :movies)
  end
end
