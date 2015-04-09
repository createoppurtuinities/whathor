require "whathor/version"
require 'rest_client'

module Whathor

  def self.subscribe(token)
    @token = token
    resp = RestClient.get 'https://api.wha.tools/v0/subscribe', {params: {key: @token}} # => "{\"success\": true}"
    JSON.parse(resp, symbolize_names: true)[:success]
  end

  def self.unsubscribe
    return false if @token.nil?
    resp = RestClient.get 'https://api.wha.tools/v0/unsubscribe', {params: {key: @token}} # => "{\"success\": true}"
    JSON.parse(resp, symbolize_names: true)[:success]
  end

  def self.message(to: '', body: '')
    raise ArgumentError.new("number of receiver\'s message is empty") unless !to.empty?
    raise ArgumentError.new("body of message is empty") unless !body.empty?
    return false if @token.nil?
    resp = RestClient.post 'https://api.wha.tools/v0/message', key: @token, to: to, body: body, ack: true # => "{\"result\": \"0123456789-0\", \"success\": true}"
    JSON.parse(resp, symbolize_names: true)[:success]
  end

end
