class HomeController < ApplicationController
  def index
    render :json => { test: 'Works!!!' }
  end
end
