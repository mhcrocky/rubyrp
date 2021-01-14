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

  def twilio
    require 'twilio-ruby'
    # Your Account Sid and Auth Token from twilio.com/console
    # and set the environment variables. See http://twil.io/secure
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    token = @client.tokens.create
    #  # &quot;account_sid&quot;: &quot;#{p ENV['TWILIO_ACCOUNT_SID']}&quot;,
    # "&quot;username&quot;: &quot;#{p token.username}&quot;, &quot;ice_servers&quot;: #{p token.ice_servers.to_json}, &quot;date_updated&quot;: &quot;#{p token.date_updated}&quot;, &quot;ttl&quot;: &quot;#{p token.ttl}&quot;, &quot;date_created&quot;: &quot;#{p token.date_created}&quot;, &quot;password&quot;: &quot;#{p token.password}&quot;"
    "#{p token.ice_servers.to_json}"
  end

end
