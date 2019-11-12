Rails.application.routes.draw do

  resources :items do
    resources :comments, only: [:create, :destroy]
  end

  resources :cards, only: [:new, :show]
  resources :mypages, only: [:index, :destroy, :edit, :show]
  resources :addresses, only:[:new, :edit, :show]

  resources :photos, only: [:index, :create]

  get "addresses" => "addresses#phone"
  root 'items#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/index' => 'devise/registrations#index'
  end
end
