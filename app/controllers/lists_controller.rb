class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @bookmarks = @list.bookmarks
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
