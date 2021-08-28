class Room < ApplicationRecord

  belongs_to :user

  visitable :ahoy_visit

  validates_presence_of :user

  validates :name, presence: true

  before_create :set_room_key

  # Returns only rooms created in the past 24 hours
  scope :daily, -> {
    where("created_at > ?", 1.day.ago)
  }

  # Returns STUN and TURN server info from Twilio (before_create)
  def set_room_key
    require 'twilio-ruby'
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    token = @client.tokens.create
    self.room_key = token.ice_servers.to_json
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
