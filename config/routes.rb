Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :cars, only: %i[index new create show edit]
  get    "users/account",      to: "users#show",  as: :user
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "cars/:id/edit" => "car#edit"
  patch 'cars/:id', to: 'cars#update'
  delete 'cars/:id', to: 'cars#destroy'
  # Defines the root path route ("/")
  # root "articles#index"
end
