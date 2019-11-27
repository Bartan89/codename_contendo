Rails.application.routes.draw do


  get 'requests/create'
  devise_for :users

  root to: 'pages#home'

  resources :dashboards, only: :show

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
    resources :requests, only: [:create, :destroy]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
