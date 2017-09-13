Rails.application.routes.draw do


  devise_for :admins, controllers: { sessions: 'hq/sessions', registrations: 'hq/registrations', passwords: 'hq/passwords' }, path: 'hq',
             path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret',  confirmation: 'verification' }

  as :admin do
    get 'hq/edit' => 'hq/registrations#edit', as: 'edit_hq_registration'
    put 'hq' => 'hq/registrations#update', as: 'hq_registration'
  end

  namespace :hq do
    get 'dashboard/index'
    root to: 'dashboard#index'
    resources :admins
    resources :dashboard, only: [:index]
    resources :users
  end


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
