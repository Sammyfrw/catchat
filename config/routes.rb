Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resource :guest_session, only: [:create, :destroy]
  resources :users, only: [:new, :create]

  resources :chatrooms, only: [:index, :show, :new, :create]

  Blog::Application.routes.draw do
    constraints Monban::Constraints::SignedIn.new do
      root to: "chatrooms#index"
  end

  root to: "sessions#new"
end
