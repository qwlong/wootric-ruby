class Wootric::Client

  attr_reader :auth_token

  def initialize(email, password, auth_token=nil)
    @auth_token = auth_token || self.auth_client_and_return_token(email, password)
  end

  def auth_client_and_return_token(email, password)
    response ||= Faraday.post do |req|
      req.url "https://api.wootric.com/oauth/token"
      req.params['grant_type'] = "password"
      req.params['username'] = email
      req.params['password'] = password
    end
    auth_token = JSON.parse(response.body)["access_token"]
    auth_token
  end
end
