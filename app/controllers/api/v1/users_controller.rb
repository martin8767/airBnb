module Api
  module V1
    class UsersController < ApiController
      before_action :authenticate_user!
      before_action :auth_user

      helper_method :user
      
      def show; end

      def update
        @user = current_user.update!(user_params)
        render :show
      end

      private

      def auth_user
        p params
        if current_user.id.to_s == params[:id]
          return true
        else
          head :forbidden
        end
      end

      def user
        @user ||= User.find_by!(id: params[:id])
      end

      def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email)
      end
    end
  end
end
