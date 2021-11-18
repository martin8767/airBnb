# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    confirmations:      'confirmations',
    passwords:          'passwords',
    registrations:      'registrations',
    sessions:           'sessions'
  }
  
  resources :users
  resources :listings
  root 'home#index'
  mount_devise_token_auth_for 'User', at: 'auth'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
