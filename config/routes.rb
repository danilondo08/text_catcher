Rails.application.routes.draw do
  get 'home/index'
  # root 'home#index'
  devise_for :users, sign_out_via: [:get] 
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'texts_catcher#new' 
  resources :texts_catcher, only: [:show, :create, :new, :index]
  resources :all_user_images, only: [:index]
end
