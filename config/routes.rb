Rails.application.routes.draw do
  devise_for :users
   root to: "items#index"
   resources :users, only: [:edit, :update, :index ]
   resources :items do
   resources :orders, only: [:create, :index, :new]
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
