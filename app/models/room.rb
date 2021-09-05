class Room < ApplicationRecord

  belongs_to :user

  visitable :ahoy_visit

  validates_presence_of :user

  validates :name, presence: true

  broadcasts_to ->(room) { :rooms }, inserts_by: :prepend

  # active_record callbacks ... rooms hotwire broadcast
  after_create_commit  { broadcast_prepend_to 'rooms' }
  after_update_commit  { broadcast_replace_to 'rooms' }
  after_destroy_commit { broadcast_remove_to 'rooms' }

  # active_record callback ... call set_room_key method before create
  before_create :set_room_key

  # Returns only rooms created in the past 24 hours
  scope :daily, -> {
    where("created_at > ?", 1.day.ago)
  }

  # Returns a string .. formatted Room created_at field
  def created
    if self.created_at > 1.day.ago
      "Today"
    elsif self.created_at > 1.week.ago
      "#{ActionController::Base.helpers.distance_of_time_in_words Time.now.to_date, self.created_at} ago"
    else
      "#{self.created_at.strftime('%b %-d, %Y')}"
    end
  end

  # Returns a string .. formatted Room updated_at field
  def updated
    if self.updated_at > 1.day.ago
      "Today"
    elsif self.updated_at > 1.week.ago
      "#{ActionController::Base.helpers.distance_of_time_in_words Time.now.to_date, self.updated_at} ago"
    else
      "#{self.updated_at.strftime('%b %-d, %Y')}"
    end
  end

  # Returns STUN and TURN server info from Twilio (before_create)
  def set_room_key
    require 'twilio-ruby'
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    token = @client.tokens.create
    self.room_key = token.ice_servers
                         .to_json
                         .html_safe
  end

  # Returns a string .. strip out unknown characters, etc.. for title in word tree
  def strip_name_for_tree
    self.name
        .downcase
        .gsub(/[^a-z0-9\s]/i, ' ')
        .gsub(/[^0-9A-Za-z]/, ' ')
        .gsub(/and|are|but|can|from|has|have|had|too|the|there|very|way|where|who/, ' ')
  end

  # Search
  def self.search(search)
    if search && search.length > 0
      select('rooms.*, lower(rooms.name)').
      joins("LEFT OUTER JOIN users ON users.id = rooms.user_id").
        where("lower(rooms.name) LIKE ? OR lower(users.email) LIKE ?",
          "%#{search.downcase}%",
          "%#{search.downcase}%").
        distinct
    else
      where(nil)
    end
  end

  # Returns an array .. class method: number of rooms month over year
  def self.month_of_year_rooms
           group_by_month_of_year(:created_at)
          .count
          .map{ |k, v| [I18n.t("date.month_names")[k], v] }
  end

end
