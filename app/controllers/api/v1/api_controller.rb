module Api
  module V1
    class ApiController < ActionController::API
      include DeviseTokenAuth::Concerns::SetUserByToken
    
      rescue_from ActionController::ParameterMissing,   with: :render_parameter_missing
      rescue_from ActiveRecord::RecordInvalid,          with: :render_record_invalid
      rescue_from ActiveRecord::RecordNotFound,         with: :not_found
      rescue_from ActiveRecord::RecordNotUnique,        with: :not_unique
    
      private

      def render_parameter_missing(e)
        render json: { error: e.message }, status: :unprocessable_entity
      end

      def render_record_invalid(e)
        render json: { error: e.message }, status: :bad_recuest
      end

      def not_found(e)
        render json: { error: e.message }, status: :not_found
      end

      def not_unique(e)
        render json: { error: e.message }, status: :conflict
      end
    end
  end
end

