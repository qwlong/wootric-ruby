Dir[File.join(__dir__, 'modules', '*.rb')].each {|file| require file }

class Wootric::Client
  include EndUser
  include Response
  include EndUserSetting
  include Decline

  attr_reader :auth_token

  def initialize(client_id, client_secret, auth_token=nil)
    @auth_token = auth_token || self.auth_client_and_return_token(client_id, client_secret)
  end

  def auth_client_and_return_token(client_id, client_secret)
    response ||= Faraday.post do |req|
      req.url "https://api.wootric.com/oauth/token"
      req.body = { grant_type: 'client_credentials', client_id: client_id, client_secret: client_secret }
    end
    auth_token = JSON.parse(response.body)["access_token"]
  end

  def connection
    Faraday.new(:url => "https://api.wootric.com/v1/") do |req|
      req.adapter :net_http
      req.headers['Content-Type'] = 'application/json'
      req.headers['User-Agent'] = "Wootric-Ruby v#{Wootric::VERSION}"
      req.headers['Authorization'] = "Bearer #{self.auth_token}"
    end
  end
end