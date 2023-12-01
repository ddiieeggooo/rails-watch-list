Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "lists#index"
  resources :lists, only: [:show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
  # Defines the root path route ("/")
  # root "posts#index"
end

    # As a user, I can see all my movie lists ok
    # As a user, I can create a movie list ok
    # As a user, I can see the details of a movie list ok
    # As a user, I can bookmark a movie inside a movie list
    # dans la show d'une list, je peux create a bookmark
    # As a user, I can destroy a bookmark
