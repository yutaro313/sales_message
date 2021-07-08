Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :sales, path: 'sales', controllers: {
    sessions: 'sales/sessions',
    passwords: 'sales/passwords'
  }

  devise_for :customers, path: 'customers', controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  root to: "customer/homes#top"
  get "/about" => "customer/homes#about"

  namespace :customer do
    resource :customers, only: [:show, :edit, :update]
    resources :messages, only: [:index, :create]
    resource :profiles, only: [:show]
    resources :plans
    resources :posts, only: [:index] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :notifications, only: [:index]
  end

  namespace :sale do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :plans
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
    end
    resource :profiles, only: [:show, :edit, :update]
    resources :notifications, only: [:index]
  end

end
