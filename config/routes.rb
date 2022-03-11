Rails.application.routes.draw do
  resources :items, defaults: { format: 'json' }, constraints: ->(req) { req.format == :json }
end
