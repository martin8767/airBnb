module Api
  module V1
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
      include Api::Concerns::ActAsApiRequest
    end
  end
end
