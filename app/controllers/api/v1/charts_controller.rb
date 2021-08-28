class Api::V1::ChartsController < ApplicationController
  before_action :authenticate_user!

  ## Users
  def month_of_year_users
    render json: User.month_of_year_users
  end
  def month_of_year_superadmins
    render json: User.month_of_year_superadmins
  end
  def month_of_year_admins
    render json: User.month_of_year_admins
  end
  def month_of_year_members
    render json: User.month_of_year_members
  end
  def month_of_year_visitors
    render json: User.month_of_year_visitors
  end
  def free_member_roles
    render json: ({
      "Admins" => User.with_any_role(:sysadmin, :superadmin, :admin).count,
      "Members" => User.with_role(:member).count,
      "Free Users" => User.with_role(:visitor).count
    })
  end
  def user_themes
    render json: ({
      "Dark Theme"  => User.where(dark_theme: true).count,
      "Light Theme" => User.where(dark_theme: false).count
    })
  end
  def user_timezones
    render json: User.group(:timezone).count
  end

  ## Articles
  def article_likes
    render json: UsersArticle.top_ten_article_likes
  end
  def month_of_year_article_likes
    render json: UsersArticle.month_of_year_article_likes
  end
  def month_of_year_articles
    render json: Article.month_of_year_articles
  end
  def month_of_year_single_articles
    render json: current_user.articles_count
  end
  def free_member_articles
    render json: ({
      "By Admins"     => Article.where(user_id: User.with_any_role(:sysadmin, :superadmin, :admin)).count,
      "By Members"    => Article.where(user_id: User.with_role(:member)).count,
      "By Free Users" => Article.where(user_id: User.with_role(:visitor)).count
    })
  end

  ## Rooms
  def month_of_year_rooms
    render json: Room.month_of_year_rooms
  end
  def month_of_year_single_rooms
    render json: current_user.rooms_count
  end
  def chat_rooms
    render json: Room.group(:name).count
  end

  ## Todo Items
  def complete_incomplete_todos
    render json: ({
      "Not Complete" => TodoItem.accessible_by(current_ability).where(complete: false).count,
      "Complete"     => TodoItem.where(complete: true).count
    })
  end
  def complete_incomplete_single_todos
    render json: ({
      "Not Complete" => current_user.todo_items.where(complete: false).count,
      "Complete"     => current_user.todo_items.where(complete: true).count
    })
  end
  def month_of_year_todos
    render json: TodoItem.month_of_year_todos
  end
  def month_of_year_single_todos
    render json: current_user.todo_items_count
  end

  ## Analytics
  def month_of_year_visits
    render json: Ahoy::Visit.month_of_year_visits
  end
  def month_of_year_visit_events
    render json: Ahoy::Event.month_of_year_visit_events
  end
  def device_type
    render json: Ahoy::Visit.devices
  end
  def os_type
    render json: Ahoy::Visit.operating_systems
  end
  def browser_type
    render json: Ahoy::Visit.browsers
  end
  def landing_pages
    render json: Ahoy::Visit.landing_pages
  end
  def visit_mapping
    render json: Ahoy::Visit.countries
  end
  def visit_country
    render json: Ahoy::Visit.countries
  end
  def visit_region
    render json: Ahoy::Visit.regions
  end
  def visit_city
    render json: Ahoy::Visit.cities
  end
  def month_of_year_viewed_welcome
    render json: Ahoy::Event.month_of_year_viewed_welcome
  end
  def month_of_year_viewed_dashboard
    render json: Ahoy::Event.month_of_year_viewed_dashboard
  end
  def month_of_year_viewed_blog
    render json: Ahoy::Event.month_of_year_viewed_blog
  end
  def month_of_year_viewed_rooms
    render json: Ahoy::Event.month_of_year_viewed_rooms
  end
  def month_of_year_viewed_list
    render json: Ahoy::Event.month_of_year_viewed_list
  end
  def month_of_year_viewed_article
    render json: Ahoy::Event.month_of_year_viewed_article
  end
  def month_of_year_viewed_room
    render json: Ahoy::Event.month_of_year_viewed_room
  end
  def month_of_year_viewed_user
    render json: Ahoy::Event.month_of_year_viewed_user
  end
  def month_of_year_viewed_terms
    render json: Ahoy::Event.month_of_year_viewed_terms
  end
  def month_of_year_viewed_privacy_policy
    render json: Ahoy::Event.month_of_year_viewed_privacy_policy
  end
  def month_of_year_viewed_cookies_policy
    render json: Ahoy::Event.month_of_year_viewed_cookies_policy
  end
  def month_of_year_viewed_sitemap
    render json: Ahoy::Event.month_of_year_viewed_sitemap
  end

end
