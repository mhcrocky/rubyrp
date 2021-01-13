class Room < ApplicationRecord

  belongs_to :user

  validates_presence_of :user

  validates :name, presence: true

  def self.search(search)
    if search && search.length > 0
      where("lower(name) LIKE ?", "%#{search.downcase}%")
    else
      where(nil)
    end
  end

  def twilio_username
    require 'twilio-ruby'
    # Your Account Sid and Auth Token from twilio.com/console
    # and set the environment variables. See http://twil.io/secure
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    token = @client.tokens.create
    "#{p token.username}"
  end
  def twilio_ice_servers
    require 'twilio-ruby'
    # Your Account Sid and Auth Token from twilio.com/console
    # and set the environment variables. See http://twil.io/secure
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    token = @client.tokens.create
    "#{p token.ice_servers.to_json}"
  end

  # def twilio_credentials
  #   "#{self.twilio.to_s}"
  # end

end
