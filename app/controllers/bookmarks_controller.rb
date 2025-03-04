class BookmarksController < ApplicationController
  before_action :set_list
  before_action :set_bookmark, only: [:new, :create, :destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = @list.bookmarks.build(bookmark_params)
    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to @list, notice: 'Bookmark was successfully destroyed.'
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find_by(id: params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
