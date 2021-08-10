class Ahoy::Event < ApplicationRecord
  include Ahoy::QueryMethods

  self.table_name = "ahoy_events"

  belongs_to :visit
  belongs_to :user, optional: true

  # Returns an array .. class method: number of visit events month over year
  def self.month_of_year_visit_events
           group_by_month_of_year(:time)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns an array .. class method: number of welcome page views month over year
  def self.month_of_year_viewed_welcome
           where_event("Viewed Welcome")
          .group_by_month_of_year(:time)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns an array .. class method: number of dashboard page views month over year
  def self.month_of_year_viewed_dashboard
           where_event("Viewed Dashboard")
          .group_by_month_of_year(:time)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns an array .. class method: number of blog page views month over year
  def self.month_of_year_viewed_blog
           where_event("Viewed Blog")
          .group_by_month_of_year(:time)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns an array .. class method: number of rooms page views month over year
  def self.month_of_year_viewed_rooms
           where_event("Viewed Rooms")
          .group_by_month_of_year(:time)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns an array .. class method: number of ToDo list page views month over year
  def self.month_of_year_viewed_list
           where_event("Viewed ToDo List")
          .group_by_month_of_year(:time)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns an array .. class method: number of @article page views month over year
  def self.month_of_year_viewed_article
           where('name LIKE ?', "%Viewed Article: %")
          .group_by_month_of_year(:time)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns an array .. class method: number of @room page views month over year
  def self.month_of_year_viewed_room
           where('name LIKE ?', "%Viewed Room: %")
          .group_by_month_of_year(:time)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns an array .. class method: number of @user page views month over year
  def self.month_of_year_viewed_user
           where('name LIKE ?', "%Viewed User: %")
          .group_by_month_of_year(:time)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns an array .. class method: number of terms page views month over year
  def self.month_of_year_viewed_terms
           where_event("Viewed Terms and Conditions")
          .group_by_month_of_year(:time)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns an array .. class method: number of privacy page views month over year
  def self.month_of_year_viewed_privacy_policy
           where_event("Viewed Privacy Policy")
          .group_by_month_of_year(:time)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns an array .. class method: number of cookie page views month over year
  def self.month_of_year_viewed_cookies_policy
           where_event("Viewed Cookie Policy")
          .group_by_month_of_year(:time)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns an array .. class method: number of sitemap page views month over year
  def self.month_of_year_viewed_sitemap
           where_event("Viewed Sitemap")
          .group_by_month_of_year(:time)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

end
