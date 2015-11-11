Rails.application.routes.draw do
  resources :meals
  root 'meals#index'


  devise_for :users
end
