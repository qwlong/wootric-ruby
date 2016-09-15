require 'spec_helper'

class Wootric::Client
  describe Decline do
    before(:all) do
      @client = Wootric::Client.new(ENV['APP_EMAIL'], ENV['APP_PASSWORD'])
      @client.create_decline(16313044)
      @decline = @client.declines[0]["id"]
    end

    describe "#declines" do
      it "returns a collection of declines for a user" do
        expect(@client.declines).to be_an_instance_of(Array)
      end
    end

    describe "#end_user_declines" do
      it "returns all declines for a end user" do
        expect(@client.end_user_declines(16313044)).to be_an_instance_of(Array)
      end
    end

    describe "#find_decline" do
      it "returns a specific decline" do
        expect(@client.find_decline(16313044, @decline)).to be_an_instance_of(Hash)
      end
    end

    describe "#delete_decline" do
      it "deletes a decline specific to a end user" do
        expect(@client.delete_decline(16313044, @decline)).to be_an_instance_of(Hash)
      end
    end

    describe "#create_decline" do
      it "creates a new decline for a end user" do
        expect(@client.create_decline(16313044).status).to eq(201)
      end
    end

  end
end