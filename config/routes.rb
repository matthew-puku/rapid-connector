# frozen_string_literal: true

Rails.application.routes.draw do
  resources :rapid_connections
  root 'rapid_connections#index'
end
