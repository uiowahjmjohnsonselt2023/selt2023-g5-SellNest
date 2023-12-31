class HomeController < ApplicationController
  def index
    @listings = params[:search] ? Listing.search_by_title(params[:search]) : Listing.all

    case params[:sort]
    when 'price_asc'
      @listings = @listings.order(price: :asc)
    when 'price_desc'
      @listings = @listings.order(price: :desc)
    when 'newest'
      @listings = @listings.order(created_at: :desc)
    when 'oldest'
      @listings = @listings.order(created_at: :asc)
    end

    @listings = @listings.where('price >= ?', params[:min_price].to_f) if params[:min_price].present?
    @listings = @listings.where('price <= ?', params[:max_price].to_f) if params[:max_price].present?
    @listings = @listings.joins(:tags).where(tags: { id: params[:tags] }) if params[:tags].present?

    @recent_listings = Listing.order(created_at: :desc).limit(5)
    @oldest_listings = Listing.order(created_at: :asc).limit(5)


    render :index
  end
  def self.search_by_title(search)
    where("LOWER(title) LIKE LOWER(?)", "%#{search}%")
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

  def edit
    @listing = Listing.find params[:id]
  end

  def new
    @listing = Listing.new
    @tags = Tag.all
  end

  def show
    @listing = Listing.includes(:tags).find(params[:id])
  end


  def listing_params
    params.require(:listing).permit(:name, :description, :price, :user_id, photos: [], tag_ids: [])
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      flash[:notice] = "#{@listing.name} was successfully created."
      redirect_to listings_path
    else
      render 'new'
    end
  end
end
