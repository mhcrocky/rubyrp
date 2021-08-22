class Room < ApplicationRecord

  belongs_to :user

  visitable :ahoy_visit

  validates_presence_of :user

  validates :name, presence: true

  before_create :set_room_key

  # Returns only chats created in the past week
  scope :this_week, -> {
    where("created_at > ?", 1.week.ago)
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
