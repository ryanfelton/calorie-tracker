Rails.application.routes.draw do
  resources :meals
  root 'application#index'


  devise_for :users
end
