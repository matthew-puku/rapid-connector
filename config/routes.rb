# frozen_string_literal: true

Rails.application.routes.draw do
  resources :rapid_connections do
    resources :sessions, only: :create
  end
  root 'rapid_connections#index'
end
