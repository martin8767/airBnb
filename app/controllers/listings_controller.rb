class ListingsController < ApiController
  before_action :authenticate_user!
  before_action :set_listing, only: %i[show update destroy]

  def index
    @listings = current_user.listings
  end

  def new
    @listing = Listing.new
  end

  def show
  end

  def create
    @listing = current_user.listings.create!()
    render :show
  end

  def update
    @listing.update!({})
    render :show
  end

  def destroy
    if @listing
      @listing.destroy!
    end
  end

  private

  def listing_params
    params
  end

  def update_params
    params
  end

  def set_listing
    @listing = Listing.find_by(id: params[:id])
  end
end
