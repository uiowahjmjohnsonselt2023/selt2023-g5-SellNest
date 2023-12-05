class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @listing_id = params[:listing_id]
    @user_id = current_user.id

    if @review.save
      redirect_to user_path(current_user)
    else
      flash[:alert] = 'Error creating the review.'
      render 'new'
    end
  end

  def new
    @review = Review.new
    @listing_id = params[:listing_id]
    @user_id = current_user.id
  end

  def review_params
    params.require(:review).permit(:content, :rating, :listing_id, :user_id)
  end
end
