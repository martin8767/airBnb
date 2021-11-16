module Api
  module V1
    class ApiController < ActionController::API
      include DeviseTokenAuth::Concerns::SetUserByToken
    
      rescue_from ActiveRecord::RecordNotFound, with: :not_found
    
      def not_found(e)
        render json: { error: e.message }, status: :not_found
      end
    end
  end
end

