Rails.application.routes.draw do
  devise_for :users
  # get 'memos/index'

  root "memos#index"
  resources :users, only: [:edit, :update]
  resources :memos, only: [:new, :create, :edit, :update, :show, :delete]
  resources :tags,  only:[:index, :new, :create, :edit, :update, :delete]
end