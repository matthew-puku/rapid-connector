Rails.application.routes.draw do
  resources :rapid_connections
  root "rapid_connections#index"
end
