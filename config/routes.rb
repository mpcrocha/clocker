Rails.application.routes.draw do

  get 'home/index'
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get 'name_registration/new'
  resources :name_registration, only: [:new, :create]

  resources :users do
    resources :clock_records
  end
end
