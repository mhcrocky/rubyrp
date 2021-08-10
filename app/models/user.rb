class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  # default_scope { order(created_at: :desc) }

  visitable :ahoy_visit
  has_many :visits, class_name: "Ahoy::Visit"

  has_many :todo_items, dependent: :destroy
  has_many :rooms, dependent: :destroy

  has_many :users_articles
  has_many :liked_articles, through: :users_articles, source: :article

  has_many :articles, dependent: :destroy

  has_many :comments, dependent: :destroy

  after_create :assign_default_role, :first_items

  # Assigns the default role 'visitor' to a new user (after_create)
  def assign_default_role
    self.add_role(:visitor)
  end

  # Creates two ToDo items when a user is created (after_create)
  def first_items
    2.times do |i|
      self.todo_items.create(title: "Item #{i+1} for #{self.email}", complete: i % 3 == 0 ? true : false)
    end
  end

  # Search
  def self.search(search)
    if search && search.length > 0
      where("lower(email) LIKE ?", "%#{search.downcase}%")
    else
      where(nil)
    end
  end

  # Returns a datetime .. formatted created_at in the user's timezone
  def created
    self.created_at.in_time_zone("#{self.timezone}").strftime('%b %-d, %Y.  %l:%M %p')
  end

  # Returns a string .. email address before @
  def role
    if self.roles.present?
      "#{self.roles.first.name}"
    end
  end

  # Returns a string .. email address before @
  def name
    "#{self.email.split('@').first}"
  end

  # Returns a datetime .. formatted current_sign_in_at in the user's timezone
  def current_login
    if self.current_sign_in_at.present?
      self.current_sign_in_at.in_time_zone("#{self.timezone}").strftime('%b %-d, %Y.  %l:%M %p')
    end
  end

  # Returns a string .. landing_page from the .last visit
  def landing
    if self.visits.present?
      "#{self.visits.last.landing_page}"
    else
      ''
    end
  end

  # Returns a string .. referring_domain from second to .last visit .last(2)[0] for current_user
  def second_to_last_referring_domain
    if self.visits.present? && self.visits.count > 1
      "#{self.visits.second_to_last.referring_domain}"
    else
      last_referring_domain
    end
  end

  # Returns a string .. .last event of .last visit
  def last_page
    if self.visits.present?
      if self.visits.last.events.present?
        "#{self.visits.last.events.last.name}"
      else
        ''
      end
    end
  end

  # Returns a string .. second_to_last event of .last visit .last(2)[0] for current_user
  def second_to_last_page
    if self.visits.present?
      if self.visits.last.events.present? && self.visits.last.events.count > 1
        "#{self.visits.last.events.second_to_last.name}"
      else
        last_page
      end
    end
  end

  # Returns a string .. OS and browser of .last visit
  # Fallback -> device_type
  def tech
    if self.visits.present?
      if self.visits.last.os.present? && self.visits.last.browser.present?
        "#{self.visits.last.browser} on #{self.visits.last.os}"
      elsif self.visits.last.device_type.present? && self.visits.last.os.present?
        "#{self.visits.last.os} on #{self.visits.last.device_type}"
      elsif self.visits.last.device_type.present? && self.visits.last.browser.present?
        "#{self.visits.last.browser} on #{self.visits.last.device_type}"
      elsif self.visits.last.browser.present?
        "#{self.visits.last.browser}"
      elsif self.visits.last.os.present?
        "#{self.visits.last.os}"
      elsif self.visits.last.device_type.present?
        "#{self.visits.last.device_type}"
      else
        ''
      end
    end
  end

  # Returns a string .. city and country of .last visit
  # Fallbacks -> region, latitude and longitude
  def location
    if self.visits.present?
      if self.visits.last.city.present? && self.visits.last.country.present?
        "#{self.visits.last.city}, #{self.visits.last.country}"
      elsif self.visits.last.region.present? && self.visits.last.country.present?
        "#{self.visits.last.region}, #{self.visits.last.country}"
      elsif self.visits.last.city.present? && self.visits.last.region.present?
        "#{self.visits.last.city}, #{self.visits.last.region}"
      elsif self.visits.last.city.present?
        "#{self.visits.last.city}"
      elsif self.visits.last.region.present?
        "#{self.visits.last.region}"
      elsif self.visits.last.country.present?
        "#{self.visits.last.country}"
      elsif self.visits.last.latitude.present? && self.visits.last.longitude.present?
        "#{self.visits.last.latitude}, #{self.visits.last.longitude}"
      else
        ''
      end
    end
  end

  # Returns an integer .. number of articles the user currently likes
  def liked_by_count
    # UsersArticle.where(user: self).count
    self.liked_articles.count
  end

  # Returns an array .. number of articles the user currently has month over year
  def articles_count
    self.articles
        .group_by_month_of_year(:created_at)
        .count
        .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns an array .. number of ToDo items the user currently has month over year
  def todo_items_count
    self.todo_items
        .group_by_month_of_year(:created_at)
        .count
        .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns an array .. class method: number of users month over year
  def self.month_of_year_users
           group_by_month_of_year(:created_at)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns an array .. class method: number of users month over year with sysadmin role
  def self.month_of_year_sysadmins
           with_role(:sysadmin)
          .group_by_month_of_year(:created_at)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns an array .. class method: number of users month over year with superadmin role
  def self.month_of_year_superadmins
           with_role(:superadmin)
          .group_by_month_of_year(:created_at)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns an array .. class method: number of users month over year with admin role
  def self.month_of_year_admins
           with_role(:admin)
          .group_by_month_of_year(:created_at)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns an array .. class method: number of users month over year with member role
  def self.month_of_year_members
           with_role(:member)
          .group_by_month_of_year(:created_at)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

  # Returns an array .. class method: number of users month over year with visitor role
  def self.month_of_year_visitors
           with_role(:visitor)
          .group_by_month_of_year(:created_at)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

end
