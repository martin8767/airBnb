module Api
  module V1
    class ListingsController < ApiController

      helper_method :listing

      def index
        @listings = current_user.listings.includes([:amenities, 
          :amenitizations, :categories, :categorizations, :media_files_attachments])
      end

      def show; end

      def create
        @listing = current_user.listings.create!(listing_params)
        render :show
      end

      def update
        current_user.listings.find(params[:id]).update!(listing_params)
        render :show
      end

      def destroy
        current_user.listings.find(params[:id]).destroy!
      end

      private

      def listing
        @listing ||= Listing.find_by!(id: params[:id])
      end

      def listing_params
        params.require(:listing).permit(:description, :top_amount_people, :price_per_night, :location,
          categorizations_attributes: [:id, :category_id, :name ], 
          amenitizations_attributes: [:id, :amenity_id, :name ],
          media_files: [:data, :filename]
        )
      end
    end
  end
end
