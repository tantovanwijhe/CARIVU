Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :cars, only: %i[index new create show] do
    resources :bookings, only: %i[create]
  end
  get "users/:id", to: "users#show", as: :user
end
