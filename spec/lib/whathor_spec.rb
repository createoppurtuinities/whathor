require 'spec_helper'

TOKEN = "a-s-u-b-s-c-r-i-p-t-i-o-n-t-o-k-e-n"

RSpec.describe Whathor do

  context "subscription with Whatools" do
    it "subscribes an API Token with whatools" do
      allow(RestClient).to receive_messages(get: "{\"success\":true}")
      resp = Whathor.subscribe TOKEN
      expect(resp).to be_truthy
    end

    it "returns false when API Token is bad" do
      allow(RestClient).to receive_messages(get: "{\"success\":false}")
      resp = Whathor.subscribe "BADWHATOOLSTOKEN"
      expect(resp).to be_falsy
    end

    context "Given a subscription already exists" do
      before do
        allow(RestClient).to receive_messages(get: "{\"success\":true}")
        Whathor.subscribe TOKEN
      end
      it "unsubscribes with whatools" do
        resp = Whathor.unsubscribe
        expect(resp).to be_truthy
      end
    end

    it "returns false when no subscription was accomplished first" do
      resp = Whathor.unsubscribe
      expect(resp).to be_falsy
    end
  end

  context "send messages" do
    it "raises ArgumentError when :to param is empty" do
      expect{
        Whathor.message(to: '')
      }.to raise_error(ArgumentError)
    end

    it "raises ArgumentError when :body param is empty" do
      expect{
        Whathor.message(to: '579876543210', body: '')
      }.to raise_error(ArgumentError)
    end

    it "returns false if no subscription was previously performed" do
      resp = Whathor.message(to: '579876543210', body: 'Hello :)')
      expect(resp).to be_falsy
    end

    it "returns true when a message was successfully sent" do
      allow(RestClient).to receive_messages(get: "{\"success\":true}", post: "{\"success\":true}")
      Whathor.subscribe TOKEN
      resp = Whathor.message(to: '001234567890', body: 'Hello :)')
      expect(resp).to be_truthy
      Whathor.unsubscribe
    end
  end
end