class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)

    if @review.save
      # success
    else
      # failure
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :listing_id)
  end
end
