require "monban/constraints/signed_in"

Rails.application.routes.draw do
  resources :users, only: [:none] do
    resources :password_resets, only: [:edit, :update]
  end
  resources :password_resets, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  constraints Monban::Constraints::SignedIn.new do
    get "/", to: "homes#show", as: :homes
    resources :users, only: [:show, :index] do
      resource :following_relationships, only: [:create, :destroy]
    end

    resources :shouts, only: [:show] do
      resource :spam, only: [:create]
    end

    resource :admin_options, only: [:show]
    resource :timeline, only: [:show]
    resources :text_shouts, only: [:create, :edit, :update, :destroy]
    resources :photo_shouts, only: [:create, :edit, :update, :destroy]
    resources :hashtags, only: [:show]
  end

  root to: "sessions#new", via: :get
end
