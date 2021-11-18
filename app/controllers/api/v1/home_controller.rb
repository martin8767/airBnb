module Api
  module V1
    class HomeController < ApplicationController
      def index
        render :json => { test: 'Works!!!' }
      end
    end
  end
end
