Rails.application.routes.draw do
  resources :items, defaults: { format: :jsonapi }, constraints: ->(req) { req.format == :jsonapi }
end
