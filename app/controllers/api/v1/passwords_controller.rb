module Api
  module V1
    class PasswordsController < DeviseTokenAuth::PasswordsController
      include Api::Concerns::ActAsApiRequest
      before_action :auth_user

      def update
        current_user.update!(user_params)
        render :json => current_user.to_json
      end

      private

      def auth_user
        if current_user.email.to_s == params[:email]
          return true
        else
          head :forbidden
        end
      end

      def user_params
        params.permit(:password, :password_confirmation)
      end
    end
  end
end
