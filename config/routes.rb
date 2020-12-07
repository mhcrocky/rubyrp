Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show]

  authenticated :user do
    root 'pages#dashboard', as: :authenticated_root
  end

  root 'pages#welcome'

  resources :articles

  resources :todo_items, only: [:index]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # Todo Items
      resources :todo_items, only: [:index, :show, :create, :update, :destroy]
      # Articles
      resources :articles, only: [:index, :show, :create, :update, :destroy]
      # Charts
      namespace :charts do
        # Users
        get 'month_of_year-users'
        get 'free_member-roles'
        # Articles
        get 'month_of_year-articles'
        get 'month_of_year_single_articles'
        get 'free_member-articles'
        # Todo Items
        get 'complete_incomplete-todos'
        get 'complete_incomplete_single-todos'
        get 'month_of_year-todos'
        get 'month_of_year_single-todos'
      end
    end
  end

end
