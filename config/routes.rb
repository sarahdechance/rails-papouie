Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :offers do
    resources :booking, only: %i[new create]
  end


  resources :bookings, except: %i[index show new create] do
    member do
      patch "/validated", to: "booking#validated"
      patch "/refused", to: "booking#refused"
    end
  end



  get "/dashboard", to: "pages#dashboard"

end
