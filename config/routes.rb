Rails.application.routes.draw do
  resources :missions, only: [:index]
  resources :reservations
  resources :bookings
  resources :listings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
