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
    resources :customers, only: [:index, :show, :edit, :update] do
      get "/post_index" => "customers#post_index", as: "post_index"
      get "/plan_index" => "customers#plan_index", as: "plan_index"
      get "/message_index" => "customers#message_index", as: "message_index"
      resources :posts, only: [:create]
      resources :plans, only: [:create]
      resources :messages, only: [:create]
    end
    resources :message, only: [:index]
    resources :plans, only: [:new, :show, :edit, :update, :destroy]
    resources :posts, only: [:index, :new, :show, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end
    resource :profiles, only: [:show, :create, :edit, :update]
    resources :notifications, only: [:index]
  end
  get 'sale/customer/:id/plans/:id/customer/:customer_id' => 'sale/plans#show', as: "plan_show"

end
