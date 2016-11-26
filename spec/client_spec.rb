require 'spec_helper'

module Wootric
  describe Client do
    before(:each) do 
      @client = Wootric::Client.new(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
    end
    describe  "#auth_client_and_return_auth_token" do
      it "returns the users auth_token" do
        expect(@client.auth_token).to be_an_instance_of(String)
      end
    end
  end
end
