Rails.application.routes.draw do
  root to: 'sessions#index'

  direct(:login) { '/auth/calnet' } # convenience URL helper to provide login_path and login_url
  get '/logout', to: 'sessions#logout', as: :logout
  get '/auth/:provider/callback', to: 'sessions#callback', as: :omniauth_callback

  defaults format: :jsonapi do
    constraints(->(req) { req.format == :jsonapi }) do
      resources :items
      resources :terms, only: :index
      resources :facets, only: :index
    end
  end

end
