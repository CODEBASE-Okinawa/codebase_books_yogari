Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  root "top#index"
  namespace :admin do
    resources :books, only: [:index, :new, :create]
    resources :users, only: [:index]
  end

  resources :books
  resources :reservations, only: [:index, :show, :create, :destroy]
  resources :lendings, only: [:index, :show, :create, :update]
end
