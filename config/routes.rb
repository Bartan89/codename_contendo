Rails.application.routes.draw do


  devise_for :users
  root to: 'pages#home'

  resources :videos do
    resources :translations, only: [:new, :create]
  end

  resources :translations, except: [:new, :create] do
    member do
      patch "publish"
    end
    member do
      delete "unpublish"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
