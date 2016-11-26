require 'spec_helper'

class Wootric::Client
  describe EndUser do
    before(:all) do
      @client = Wootric::Client.new(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
    end

    describe "#end_users" do
      it "returns a collection of all users" do
        expect(@client.end_users).to be_an_instance_of(Array)
      end
    end

    describe "#find_end_user" do
      it "returns a specific user" do
        expect(@client.find_end_user(16313044)).to be_an_instance_of(Hash)
      end
    end

    describe "#create_end_user" do
      it "creates a end user" do
        expect(@client.create_end_user("hookengine@example.org")).to be_an_instance_of(Hash)
      end
    end

    describe "#edit_end_user" do
      it "returns a updated user" do
        expect(@client.edit_end_user(16313044, email: "hookengine_new@example.org")).to be_an_instance_of(Hash)
      end
    end

    describe "#delete_end_user" do
      it "deletes a specific user" do
        expect(@client.delete_end_user(16313044)).to be_an_instance_of(Hash)
      end
    end
  end
end
