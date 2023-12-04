class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookmarked_listings = current_user.bookmarked_listings
  end

  def create
    listing = Listing.find(params[:listing_id])
    bookmark = current_user.bookmarks.build(listing_id: listing.id)

    if bookmark.save
      redirect_to listings_path, notice: 'Listing was successfully bookmarked.'
    else
      redirect_to listings_path, alert: 'Bookmark could not be created.'
    end
  end
end
