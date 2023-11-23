class ListingsController < ApplicationController
  def edit
    @listing = Listing.find params[:id]
  end

  def new
    @listing = Listing.new
    @tags = Tag.all
  end

  def show
    id = params[:id]
    @listing = Listing.find(id)
  end

  def listing_params
    params.require(:listing).permit(:name, :photos, :description, :price, :user_id)
  end

  def create
    @listing = Listing.create!(listing_params)
    flash[:notice] = "#{@listing.name} was successfully created."
    redirect_to listings_path
  end

  def index
    @listings = Listing.all
    render :index
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      flash[:notice] = "#{@listing.name} was successfully updated."
      redirect_to listings_path
    else
      render 'edit'
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    flash[:notice] = "Listing deleted."
    redirect_to listings_path
  end

end
