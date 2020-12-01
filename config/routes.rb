Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:index, :show]

  authenticated :user do
    root 'pages#my_todo_items', as: :authenticated_root
  end

  root 'pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :todo_items, only: [:index, :show, :create, :update, :destroy]
    end
  end

  resources :articles

  resources :randoms, only: [:index]

  namespace :charts do
    # get 'dev-users'
    get 'month_of_year-users'
    # get 'dev-articles'
    get 'month_of_year-articles'
    # get 'dev-todos'
    get 'month_of_year-todos'
    get 'month_of_year_single-todos'
  end

end
