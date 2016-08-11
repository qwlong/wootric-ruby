require 'spec_helper'

class Wootric::Client
  describe EndUserSetting do
    before(:all) do
      @client = Wootric::Client.new(ENV['APP_EMAIL'], ENV['APP_PASSWORD'])
    end

    describe "#end_user_settings" do
      it "returns a specific end users settings" do
        expect(@client.end_user_settings(16313044)).to be_an_instance_of(Hash)
      end
    end

    describe "#update_user_settings" do
      it "updates settings and returns updated settings" do
        expect(@client.update_user_settings(16313044, false)).to be_an_instance_of(Hash)
      end
    end
  end
end
