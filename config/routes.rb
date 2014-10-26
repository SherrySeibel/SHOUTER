require "monban/constraints/signed_in"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  constraints Monban::Constraints::SignedIn.new do
    get "/", to: "homes#show", as: :homes
    resources :users, only: [:show]
    resources :shouts, only: [:create, :show]
  end

  root to: "sessions#new", via: :get
end
