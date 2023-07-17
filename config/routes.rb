Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  root "top#index"
  namespace :admin do
    resources :books, only: [:index, :new, :create] do
      collection do
        get "search"
        post "search_registration"
      end
    end
    resources :users, only: [:index]
  end

  resources :books
  resources :reservations, only: [:index, :show, :create, :destroy]
  resources :lendings, only: [:index, :show, :create, :update]
  resources :request_books, only: [:index, :create, :update] do
    collection {get "search"}
  end
  get "/searches", action: "index", controller: "searches"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
