class ListsController < ApplicationController
  # before_action :set_list, only: [:new, :create]

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @bookmarks = Bookmark.all
    @movies = Movie.all
  end

  def new
    @list = List.new
  end

  # @bookmark = Bookmark.new
  # ou alors
  # @bookmark = @list.bookmarks.create(bookmark_params)

  def create
    # @bookmark = Bookmark.new(bookmark_parms)
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

   private

  def list_params
    params.require(:list).permit(:name, :photos)
  end



  # def set_list
  #   @list = List.find(params[:list_id]) || List.create
  # end
end
