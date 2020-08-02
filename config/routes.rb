Rails.application.routes.draw do
  get 'summaries/index'
  get 'wrappers/index'
  get 'wrappers/show'
  get 'events/index'
  get 'events/show'
  get 'events/new'
  get 'events/edit'
  get 'events/create'

  # devise_for :users
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root "memos#index"
  resources :users, only: [:new, :edit, :update]
  resources :memos, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :events, only:[:index, :show, :new, :create, :edit, :update, :destroy]
  resources :summaries, only:[:index]
  resources :folders,  only:[:index, :show, :new, :create, :edit, :update, :destroy]
  resources :tags,  only:[:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  end
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :events
    end
  end
end