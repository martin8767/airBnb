# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount_devise_token_auth_for 'User', at: '/api/v1/users', controllers: {
    # confirmations:  'api/v1/confirmations',
    passwords:      'api/v1/passwords',
    registrations:  'api/v1/registrations',
    sessions:       'api/v1/sessions'
  }

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      devise_scope :user do
        resources :listings, except: %i[new edit]
      end
    end
  end
end
