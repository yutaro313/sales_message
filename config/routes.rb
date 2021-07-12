Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :sales, path: 'sales', controllers: {
    sessions: 'sales/sessions',
    passwords: 'sales/passwords',
    registrations: 'sales/registrations'
  }

  devise_for :customers, path: 'customers', controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  devise_scope :customer do
    get '/customers/sign_out' => 'devise/sessions#destroy'
  end

  devise_scope :sale do
    get '/sales/sign_out' => 'devise/sessions#destroy'
  end

  root to: "customer/homes#top"
  get "/about" => "customer/homes#about"

  namespace :customer do
    resource :customers, only: [:show, :edit, :update]
    resources :messages, only: [:index, :create]
    resource :profiles, only: [:show]
    resources :plans
    resources :notifications, only: [:index]
    resources :posts, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
  end

  namespace :sale do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :messages, only: [:index, :create]
    resources :plans
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end
    resource :profiles, only: [:show, :create, :edit, :update]
    resources :notifications, only: [:index]
  end

end
