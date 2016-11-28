Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [ :show, :edit, :update ]
  resources :places, only: [ :new, :create, :edit, :update ]
  resources :damages, only: [ :new, :create, :show ] do 
    resources :bookings, only: [ :new, :create ]
  end
  resources :providers, only: [ :show, :index ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
