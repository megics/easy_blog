Rails.application.routes.draw do
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

  resources :articles do
    resources :categories
  end

end
