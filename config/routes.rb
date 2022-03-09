Rails.application.routes.draw do
  resources(
    :items,
    only: %i[index show],
    defaults: { format: 'json' },
    constraints: ->(req) { req.format == :json }
  )
end
