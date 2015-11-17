Rails.application.routes.draw do
  # root 'welcome#index'
  root 'application#index'

  namespace :api do
    resources :users, only: [:create] do
      resources :meals, only: [:index, :create, :update, :destroy], controller: 'users/meals'
    end
    resources :meals, only: [:index, :create, :update, :destroy]

    post 'api_keys', to: 'api_keys#create'
    delete 'api_keys', to: 'api_keys#destroy'
  end

end
