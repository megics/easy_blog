Rails.application.routes.draw do
  namespace :hq do
    root to: 'hq#index'
  end

  devise_for :admins
  get 'categories/index'

  get 'categories/new'

  get 'categories/show'

  get 'welcome/index'
  resources :articles
  root 'welcome#index'

  devise_for :users
  resources :users do
    resources :profiles
  end

  resources :articles do
    resources :comments, only: [:create, :destroy]
  end

  resources :categories, only: [:index, :show]

end
