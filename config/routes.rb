Rails.application.routes.draw do
  devise_for :users
  # get 'memos/index'

  root "memos#index"
  resources :users, only: [:edit, :update]
  resources :memos, only: [:show, :new, :create, :edit, :update, :delete]
  resources :tags,  only:[:index, :show, :new, :create, :edit, :update, :delete] do
    collection do
      get 'filter'
    end
  end
end