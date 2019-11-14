Rails.application.routes.draw do
  root 'items#index'
  resources :items
  resources :mypages, only: [:index, :destroy, :edit, :show]
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
