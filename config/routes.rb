require "monban/constraints/signed_in"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  constraints Monban::Constraints::SignedIn.new do
    get "/", to: "homes#show", as: :homes
    resources :users, only: :show do
      resource :following_relationships, only: :create
    end
    resources :shouts, only: :show
    resources :text_shouts, only: :create
    resources :photo_shouts, only: :create
  end

  root to: "sessions#new", via: :get
end
