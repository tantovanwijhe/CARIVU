Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :cars, only: %i[index new create show]
  resources :bookings
  get "users/:id", to: "users#show", as: :user
end
