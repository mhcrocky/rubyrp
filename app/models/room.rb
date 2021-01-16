class Room < ApplicationRecord

  belongs_to :user

  validates_presence_of :user

  validates :name, presence: true

  before_create :set_room_key

  def set_room_key
    require 'twilio-ruby'
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    token = @client.tokens.create
    self.room_key = token.ice_servers.to_json
  end

  def self.search(search)
    if search && search.length > 0
      where("lower(name) LIKE ?", "%#{search.downcase}%")
    else
      where(nil)
    end
  end

end
