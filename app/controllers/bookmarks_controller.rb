class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark.list = List.find(params[:list_id])
    @bookmark.save
    redirect_to list_path(params[:list_id])
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

end


# @bookmark = Bookmark.new({comment: params[:bookmark][:comment], movie: Movie.find(params[:bookmark][:movie_id]), list: List.find(params[:list_id])})
