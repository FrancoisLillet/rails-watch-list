class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new({comment: params[:bookmark][:comment], movie: Movie.find(params[:bookmark][:movie_id]), list: List.find(params[:list_id])})
    @bookmark.save
    redirect_to list_path(params[:list_id])
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie, :list)
  end
end
