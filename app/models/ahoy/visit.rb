class Ahoy::Visit < ApplicationRecord
  self.table_name = "ahoy_visits"

  has_many :events, class_name: "Ahoy::Event", dependent: :destroy
  belongs_to :user, optional: true

  # Returns only visits created in the past 24 hours
  scope :daily, -> {
    where("started_at > ?", 1.day.ago)
  }

  # Returns bots that slip by Ahoy
  scope :dirty, -> {
    daily.where(device_type: nil)
  }

  # Clean up bots that slip by Ahoy.
  # Run daily with Heroku Scheduler:  $ Ahoy::Visit.clean
  def self.clean
           dirty.destroy_all
  end

  # Send daily Ahoy report
  # Run daily with Heroku Scheduler:  $ Ahoy::Visit.daily_report
  def self.daily_report
    ReportMailer.daily.deliver_now
  end

  # Returns a string .. city and country of .last visit
  # Fallbacks -> region, latitude and longitude
  def location
    if self.city.present? && self.country.present?
      "#{self.city}, #{self.country}"
    elsif self.region.present? && self.country.present?
      "#{self.region}, #{self.country}"
    elsif self.city.present? && self.region.present?
      "#{self.city}, #{self.region}"
    elsif self.city.present?
      "#{self.city}"
    elsif self.region.present?
      "#{self.region}"
    elsif self.country.present?
      "#{self.country}"
    elsif self.latitude.present? && self.longitude.present?
      "#{self.latitude}, #{self.longitude}"
    else
      ''
    end
  end

  # Returns a hash .. class method: bowsers that have visited and their sum
  def self.browsers
           group(:browser).count
  end

  # Returns a hash .. class method: OS's that have visited and their sum
  def self.operating_systems
           group(:os).count
  end

  # Returns a hash .. class method: cities that have visited and their sum
  def self.devices
           group(:device_type).count
  end

  # Returns a hash .. class method: landing pages and their sum
  def self.landing_pages
           group(:landing_page).count
  end

  # Returns a string .. landing page url after '.com'
  def landing_suffix
    "#{self.landing_page.split('com').last}"
  end

  # Returns a hash .. class method: countries that have visited and their sum
  def self.countries
           group(:country).count
  end

  # Returns a hash .. class method: regions that have visited and their sum
  def self.regions
           group(:region).count
  end

  # Returns a hash .. class method: cities that have visited and their sum
  def self.cities
           group(:city).count
  end

  # Returns an array .. class method: number of visits month over year
  def self.month_of_year_visits
           group_by_month_of_year(:started_at)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

end
