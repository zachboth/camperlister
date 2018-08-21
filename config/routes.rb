Rails.application.routes.draw do
  authenticated :user do
    root to: "listings#index", as: :authenticated_root
  end
  get :home, controller: "welcome", action: "home"
  root to: "welcome#home"
  resources :listings do
    resources :photos
  end
  resources :users, only: %i[index edit update destroy]

  # Specify controller overrides here: devise_for :users, controllers: ...
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
