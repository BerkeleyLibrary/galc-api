Rails.application.routes.draw do
  resources :closures
  root to: 'auth#index'

  direct(:login) { '/auth/calnet' } # convenience to provide login_url helper
  get '/logout', to: 'auth#logout', as: :logout
  get '/auth/:provider/callback', to: 'auth#callback', as: :omniauth_callback

  defaults format: :jsonapi do
    constraints(->(req) { req.format == :jsonapi }) do
      resources :items
      resources :terms, only: :index
      resources :facets, only: :index
      resources :reservations, only: :create
      resources :users, only: :show
      resources :build_info, only: :index
    end
  end

  direct(:current_user) { '/users/current' } # convenience to provide current_user_url helper

end
