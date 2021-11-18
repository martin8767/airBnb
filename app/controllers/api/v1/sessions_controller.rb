module Api
  module V1
    class SessionsController < DeviseTokenAuth::SessionsController
      include Api::Concerns::ActAsApiRequest
    end
  end
end
