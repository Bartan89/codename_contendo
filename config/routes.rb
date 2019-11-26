Rails.application.routes.draw do


  devise_for :users
  root to: 'pages#home'

  resources :videos do
    resources :translations, only: [:new, :create]
    member do
      post "shepard"
    end
    member do
      post "revoke"
    end
  end

  resources :translations, except: [:new, :create] do
    member do
      patch "publish"
    end
    member do
      patch "unpublish"
    end
    member do
      post "request"
    end
  end

  resources :dashboards, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
