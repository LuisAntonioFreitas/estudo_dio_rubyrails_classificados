Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # tela inicial
  # root
  root to: "home#show" # root | root_path ou root_url

  # users | base
  # get "/users", to: "users#index"         # users | users_path ou users_url
  # post "/users", to: "users#create" 
  # get "/users/new", to: "users#new"       # new_user | new_user_path => new_user_url
  # get "/users/:id/edit", to: "users#edit" # edit_user | edit_user_path => edit_user_url
  # get "/users/:id", to: "user#show"       # user | user_path => user_url
  # patch "/users/:id", to: "users#update"
  # put "/users/:id", to: "users#update"
  # delete "/users/:id", to: "users#destroy"

  # users
  resources :users, only: [:new, :create]
  
  # login | base
  # get "/sessions/new", to: "sessions#new"

  # login
  resources :sessions, only: [:new, :create] do
    # member do
    #   "/sessions/:id"
    # end
    # collection do
    #   "/sessions/"
    # end
    collection do
      delete "logout", to: "sessions#destroy", as: "logout"
    end
  end

  # ad
  resources :ads, only: [:new, :create, :edit, :update]

end
