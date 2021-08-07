Rails.application.routes.draw do

  devise_for :users

  authenticate :user, -> (user) { user.has_role?(:sysadmin) } do
    mount PgHero::Engine, at: "pghero"
  end

  authenticated :user do
    root 'pages#dashboard', as: :authenticated_root
  end

  root 'pages#welcome'

  get 'pages/terms_and_conditions'
  get 'pages/privacy_policy'
  get 'pages/cookie_policy'
  get 'pages/sitemap'

  get 'sitemap.xml', to: 'sitemap#index', defaults: { format: 'xml' }

  resources :users, only: [:show, :destroy] do
    put :toggle_theme, on: :member
  end

  resources :superadmins, only: [:new, :create]
  resources :admins, only: [:new, :create]
  resources :members, only: [:index]
  resources :visitors, only: [:index]

  resources :rooms

  resources :articles do
    resources :comments, only: [:create, :destroy]
    scope module: :articles do
      resources :likes, only: [:create, :destroy]
    end
  end

  resources :todo_items, only: [:index]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # Todo Items
      resources :todo_items, only: [:index, :show, :create, :update, :destroy]
      # Articles
      resources :articles, only: [:index, :show, :create, :update, :destroy] do
        resources :comments, only: [:create, :destroy]
      end
      # Rooms
      resources :rooms, only: [:index, :show, :create, :update, :destroy]
      # Charts
      namespace :charts do
        ## Analytics
        get 'month_of_year-visits'
        get 'month_of_year_visit-events'

        get 'month_of_year_chrome-browser'
        get 'month_of_year_edge-browser'
        get 'month_of_year_firefox-browser'
        get 'month_of_year_safari-browser'

        get 'month_of_year_viewed_terms'
        get 'month_of_year_viewed_privacy-policy'
        get 'month_of_year_viewed_cookies-policy'
        get 'month_of_year_viewed_sitemap'
        # Users
        get 'month_of_year-superadmins'
        get 'month_of_year-admins'
        get 'month_of_year-members'
        get 'month_of_year-visitors'
        get 'month_of_year-users'
        get 'free_member-roles'
        get 'user-themes'
        get 'user-timezones'
        # Articles
        get 'article-likes'
        get 'month_of_year_article-likes'
        get 'month_of_year-articles'
        get 'month_of_year_single_articles'
        get 'free_member-articles'
        # Rooms
        get 'month_of_year-rooms'
        get 'chat-rooms'
        # Todo Items
        get 'complete_incomplete-todos'
        get 'complete_incomplete_single-todos'
        get 'month_of_year-todos'
        get 'month_of_year_single-todos'
      end
    end
  end

end
