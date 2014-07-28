require "monban/constraints/signed_in"
require "monban/constraints/signed_out"
require "my_signed_in_constraint"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resource :guest_session, only: [:create, :destroy]
  resources :users, only: [:new, :create]

  resources :chatrooms, only: [:index, :show, :new, :create]

  constraints MySignedInConstraint.new do
    root "chatrooms#index"
  end

  constraints Monban::Constraints::SignedOut.new do
    get "/", to: "sessions#new"
  end
end
