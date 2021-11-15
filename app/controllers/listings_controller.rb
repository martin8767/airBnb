class ListingsController < ApiController
  before_action :authenticate_user!

  helper_method :listing

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
    listing.update!({})
    render :show
  end

  def destroy
    listing.destroy!
  end

  private

  def listing_params
    params
  end

  def update_params
    params
  end

  def listing
    @listing ||= Listing.find_by!(id: params[:id])
  end
end
