class BookmarksController < ApplicationController
  def create
    # temp code
    # @bookmark = current_user.bookmarks.build(bookmark_params)
    #     if @bookmark.save
    #       # respond with success message or update UI accordingly
    #     else
    #       # respond with error message
    #     end
  end

  def destroy
    # temp code
    # @bookmark = Bookmark.find(params[:id])
    #     @bookmark.destroy
    #     # respond to confirm deletion or update UI
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:listable_id, :listable_type)
  end
end
