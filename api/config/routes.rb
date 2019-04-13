# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "sessions#new"

  resources :youtube
  post "/youtube/download"
  get "/dl/:id/:filename", to: "youtube#get", as: "get"

  get "/auth/:provider/callback", to: "sessions#create"
  get "/auth/failure", to: redirect("/")
  delete "/signout", to: "sessions#destroy", as: "signout"
  get "/healthcheck", to: "healthcheck#index"
end
