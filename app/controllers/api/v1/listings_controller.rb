module Api
  module V1
    class ListingsController < ApiController
      before_action :authenticate_user!

      helper_method :listing

      def index
        @listings = Listing.all
      end

      def show; end

      def create
        @listing = current_user.listings.create!()
        render :show
      end

      def update
        listing.update!({})
        render :show
      end

      def destroy
        current_user.listings.find(params[:id]).destroy!
      end

      private

      def listing
        @listing ||= Listing.find_by!(id: params[:id])
      end
    end
  end
end
