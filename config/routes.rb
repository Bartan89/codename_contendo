Rails.application.routes.draw do


  get 'requests/create'
  devise_for :users

  root to: 'pages#home'

  resources :dashboards, only: :show  do
    resources :tags, only: [:show, :create, :destroy]
  end
  resources :inboxes, only: [:show, :update]

  resources :videos do
    resources :translations, only: [:new, :create]
    member do
      post "shepherd"
    end
    member do
      post "revoke"
    end
  end

  resources :briefings, only: :index

  resources :translations, except: [:new, :create] do
    member do
      patch "publish"
    end
    member do
      patch "unpublish"
    end
    resources :requests, only: [:create, :destroy, :update]
  end

  resources :formats, only: [:index, :show]

  resources :icons, only: [:index, :show, :new, :create]

  resources :picks, only: [:index, :show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
