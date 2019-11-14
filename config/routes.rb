Rails.application.routes.draw do

  root 'items#index'

  resources :items do
    member do

      get 'detail'
      get 'buy', to: 'items#buy'
      post 'pay', to: 'items#pay'
      patch 'pay', to: 'items#pay'
      get 'done', to: 'items#done'


  

    end
    resources :comments, only: [:create, :destroy]
  end

  resources :categories, only: [:index, :show]

  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

  resources :mypages, only: [:index, :destroy, :edit, :show] do
    collection do
      get 'selling'
      get 'bought'
    end
  end

  resources :addresses, only:[:new, :edit, :show]
  get "addresses" => "addresses#phone"
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' 
      get 'done' # 登録完了後のページ
    end
  end

  resources :photos, only: [:index, :create]

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

