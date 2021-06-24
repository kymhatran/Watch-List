class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save

    redirect_to lists_path(@lists)
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(params[:list]) # do you need a form?
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to lists_path(@lists)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
