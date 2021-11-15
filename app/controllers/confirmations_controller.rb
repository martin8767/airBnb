class ConfirmationsController < DeviseTokenAuth::ConfirmationsController
  skip_before_action :verify_authenticity_token
end
