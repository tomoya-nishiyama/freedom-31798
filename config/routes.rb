Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "origins#index"

  resources :users, only: [:index, :show]
  resources :origins do
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
end
