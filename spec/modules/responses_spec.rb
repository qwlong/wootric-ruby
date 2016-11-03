require 'spec_helper'

class Wootric::Client
  describe Response do
    before(:all) do
      @client = Wootric::Client.new(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
      @client.create_response(16313044, 5, "192.168.0.1", "http://example.com/", text: "This is sample text")
      @response = @client.responses[0]["id"]
    end

    describe "#responses" do
      it "returns a collection of responses for a user" do
        expect(@client.responses).to be_an_instance_of(Array)
      end
    end

    describe "#end_user_responses" do
      it "returns all responses for a end user" do
        expect(@client.end_user_responses(16313044)).to be_an_instance_of(Array)
      end
    end

    describe "#end_user_promoters_responses" do
      it "returns all promoters responses for a end user" do
        expect(@client.end_user_promoters_responses(16313044)).to be_an_instance_of(Array)
      end
    end

    describe "#end_user_passives_responses" do
      it "returns all passives responses for a end user" do
        expect(@client.end_user_passives_responses(16313044)).to be_an_instance_of(Array)
      end
    end

    describe "#end_user_detractors_responses" do
      it "returns all detractors responses for a end user" do
        expect(@client.end_user_detractors_responses(16313044)).to be_an_instance_of(Array)
      end
    end

    describe "#find_response" do
      it "returns a specific response" do
        expect(@client.find_response(16313044, @response)).to be_an_instance_of(Hash)
      end
    end

    describe "#delete_response" do
      it "deletes a response specific to a end user" do
        expect(@client.delete_response(16313044, @response)).to be_an_instance_of(Hash)
      end
    end

    describe "#create_response" do
      it "creates a new response for a end user" do
        expect(@client.create_response(16313044, 5, "192.168.0.1", "http://example.com/", text: "This is sample text").status).to eq(201)
      end
    end

  end
end
