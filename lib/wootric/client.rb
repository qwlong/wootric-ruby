Dir[File.join(__dir__, 'modules', '*.rb')].each {|file| require file }

class Wootric::Client
  include EndUser

  attr_reader :auth_token

  def initialize(email, password, auth_token=nil)
    @auth_token = auth_token || self.auth_client_and_return_token(email, password)
  end

  def auth_client_and_return_token(email, password)
    response ||= Faraday.post do |req|
      req.url "https://api.wootric.com/oauth/token"
      req.body = {'grant_type': 'password', 'username': email, 'password': password}
    end
    auth_token = JSON.parse(response.body)["access_token"]
    binding.pry
    auth_token
  end

  def connection
    Faraday.new(:url => "https://api.wootric.com/v1/") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['User-Agent'] = "Wootric-Ruby v#{Wootric::VERSION}"
      req.headers['Authorization'] = "Bearer #{self.auth_token}"
      req.adapter Faraday.default_adapter
    end
  end

end
