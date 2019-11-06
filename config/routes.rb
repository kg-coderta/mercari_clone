Rails.application.routes.draw do
  root 'items#loginheader'
  resources :items
  resources :mypages, only: [:index, :destroy, :edit, :show]
  resources :addresses, only:[:new, :edit, :show]
  get "addresses" => "addresses#phone"


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
