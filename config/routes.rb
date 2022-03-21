Rails.application.routes.draw do
  direct(:login) { '/auth/calnet' } # convenience URL helper to provide login_path and login_url
  get '/auth/:provider/callback', to: 'sessions#callback', as: :omniauth_callback

  resources :items, defaults: { format: :jsonapi }, constraints: ->(req) { req.format == :jsonapi }
end
