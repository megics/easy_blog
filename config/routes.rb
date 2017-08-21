Rails.application.routes.draw do
  get 'welcome/index'
  resources :articles
  root 'welcome#index'

  devise_for :users
  resources :users do
    resources :profiles
  end

  resources :articles do
    resources :comments
  end

end
