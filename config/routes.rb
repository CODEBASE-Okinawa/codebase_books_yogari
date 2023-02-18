Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }

  root "top#index"

  resources :books
  namespace :admin do
    resources :books, only: [:index]
  end
  get 'lendings/index', to: 'lendings#index'
  get 'lendings/show', to: 'lendings#show'
end
