Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [ :show, :edit, :update ]
  resources :places, only: [ :new, :create, :edit, :update, :show ] do
    resources :quotes, only: [ :new, :create ]
  end
  resources :quotes, only: [ :show, :update ] do
    get '/insured' => "quotes#insured"
    get '/payment' => "quotes#payment"

  end
  resources :damages, only: [ :new, :create, :show ] do
    resources :bookings, only: [ :new, :create ]
  end
  resources :providers, only: [ :show, :index ]
  get '/users/:id/infos' => 'users#infos', as: 'user_info'
  get '/quotes/:id/insure' => 'quotes#insure', as: 'insure'
  get '/places/:id/insured' => 'places#insured', as: 'insured'
  get '/places/:id/devis' => "places#devis", as: 'devis'
  mount Attachinary::Engine => "/attachinary"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end