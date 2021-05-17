Rails.application.routes.draw do
  
  root to: "items#index"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items do
    resources :sold_items, only: [:index, :create]
  end
end
