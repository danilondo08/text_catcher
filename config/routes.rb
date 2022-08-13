Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'texts_catcher/new'
  get 'texts_catcher/create'
  # get 'my_progress', to: 'calories#chart_progress'
  # get 'body_mass_index', to: 'calories#body_mass_index'
  # root 'calories#index'
end
