Rails.application.routes.draw do
  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  devise_for :users
  resources :users, only: [:index, :show, :new, :edit, :create, :update]
  resources :books, only: [:index, :show, :new, :edit, :create, :update, :destroy]

  root 'homes#top'
  get 'homes/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
