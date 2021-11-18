module Api
  module V1
    class ApiController < ActionController::API
      include Locallable
      include DeviseTokenAuth::Concerns::SetUserByToken
    
      before_action :authenticate_user!

      rescue_from ActiveRecord::RecordNotFound, with: :not_found
    
      def not_found(e)
        render json: { error: I18n.t('errors.not_found') }, status: :not_found
      end
    end
  end
end

