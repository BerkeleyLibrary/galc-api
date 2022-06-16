Rails.application.routes.draw do
  root to: 'session#index'

  direct(:login) { '/auth/calnet' } # convenience to provide login_url helper
  get '/logout', to: 'session#logout', as: :logout
  get '/auth/:provider/callback', to: 'session#callback', as: :omniauth_callback

  defaults format: :jsonapi do
    constraints(->(req) { req.format == :jsonapi }) do
      resources :items
      resources :terms, only: :index
      resources :facets, only: :index
      resources :reservations, only: :create
      resources :users, only: :show
    end
  end

  direct(:current_user) { '/users/current' } # convenience to provide current_user_url helper

end
