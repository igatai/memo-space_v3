Rails.application.routes.draw do
  devise_for :users

  root "memos#index"
  resources :users, only: [:edit, :update]
  resources :memos, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :folders,  only:[:index, :show, :new, :create, :edit, :update, :destroy]
  resources :tags,  only:[:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  end
end