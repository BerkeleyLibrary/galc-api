Rails.application.routes.draw do

  direct(:login) { '/auth/calnet' } # convenience to provide login_url helper
  get '/logout', to: 'auth#logout', as: :logout
  get '/auth/:provider/callback', to: 'auth#callback', as: :omniauth_callback

  scope module: 'preview' do
    constraints(->(_) { ENV['SERVE_TEST_UI'].present? }) do
      root to: 'preview#index', as: :preview
    end
  end

  defaults format: :jsonapi do
    constraints(->(req) { req.format == :jsonapi }) do
      resources :closures
      resources :items
      resources :terms, only: :index
      resources :facets, only: :index
      resources :reservations, only: :create
      resources :users, only: :show
      resources :build_info, only: :index
    end
  end

  post '/images', constraints: ->(req) { req.form_data? }, to: 'images#create', defaults: { format: :txt }
  get '/images/:id', to: 'images#show', as: :image, defaults: { format: :jsonapi }
  get '/images/:id/thumbnail', to: 'images#thumbnail', as: :thumbnail
  delete '/images/:id', to: 'images#destroy'

  direct(:current_user) { '/users/current' } # convenience to provide current_user_url helper
end
