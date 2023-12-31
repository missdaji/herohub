Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :services, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :edit, :update, :destroy]

  namespace :superheroes do
    resources :bookings do
      member do
        patch :accept
        patch :decline
      end
    end
    # equivalent to => get '/<namespace>/bookings', to: '<namespace>/bookings#index'
  end
end
