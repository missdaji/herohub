Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :services, only: [:index, :show, :new, :create]
  resources :bookings, only: [:index, :new, :create, :edit, :update]

  namespace :services do
    resources :bookings, only: :index
    # equivalent to => get '/<namespace>/bookings', to: '<namespace>/bookings#index'
  end
end
