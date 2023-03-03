Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users
  root to: "pages#home"

  resources :offers do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[show destroy] do
    member do
      patch "/validated", to: "bookings#validated"
      patch "/refused", to: "bookings#refused"
    end
  end

  get "/dashboard", to: "pages#dashboard"

end
