require "monban/constraints/signed_out"
require "allow_guests_sign_in_constraint"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resource :guest_session, only: [:create, :destroy]
  resources :users, only: [:new, :create]

  resources :chatrooms, only: [:index, :show, :new, :create, :destroy] do
    resources :messages, only: [:create]
  end
  resources :chatroom_memberships, only: [:destroy]

  constraints AllowGuestsSignInConstraint.new do
    root "chatrooms#index"
  end

  constraints Monban::Constraints::SignedOut.new do
    get "/", to: "sessions#new"
  end
end
