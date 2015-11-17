Rails.application.routes.draw do
  # root 'welcome#index'
  root 'application#index'

  namespace :api do
    resources :users, only: [:create] do
      resources :meals, only: [:index, :create, :update, :destroy]
    end
    post 'api_keys', to: 'api_keys#create'
    delete 'api_keys', to: 'api_keys#destroy'
  end

end
