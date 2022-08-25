Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :cars, only: %i[index new create show edit] do
    resources :bookings, only: %i[create]
  end
  
  get "users/account", to: "users#show", as: :user
  get "cars/:id/edit" => "car#edit"
  patch 'cars/:id', to: 'cars#update'
  delete 'cars/:id', to: 'cars#destroy'
end
