# frozen_string_literal: true

Rails.application.routes.draw do
  resources :plants

  # Defines the root path route ("/")
  root "plants#index"
end
