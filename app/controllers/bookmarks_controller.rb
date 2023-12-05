class BookmarksController < ApplicationController
  before_action :authenticate_user! # Ensure users are authenticated before accessing bookmarks

  def create
    @bookmark = current_user.bookmarks.build(bookmark_params)
    if @bookmark.save
      # Handle successful bookmark creation, maybe redirect somewhere
    else
      # Handle error in bookmark creation
    end
  end

  def destroy
    @bookmark = current_user.bookmarks.find_by(id: params[:id])
    if @bookmark
      @bookmark.destroy
      # Handle successful bookmark deletion, maybe redirect somewhere
    else
      # Handle error if bookmark to delete is not found
    end
  end

  private

  def bookmark_params
    params.permit(:listing_id)
  end
end
