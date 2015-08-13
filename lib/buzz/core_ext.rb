require 'rest-client'
require "uri"
require "net/http"

module Buzz
  attr_accessor :buzz_api_key
  attr_accessor :buzz_secret_token
  attr_accessor :endpoint

  DEFAULT_ENDPOINT = 'http://buzzerbox.herokuapp.com/api/track'
  # DEFAULT_ENDPOINT = 'http://localhost:3000/api/track'
  
  def initialize
    @endpoint = DEFAULT_ENDPOINT
  end

  def self.configure
    configuration.enabled = true if configuration.enabled.nil?
    yield(configuration)
  end

  def configuration
    @configuration ||= Configuration.new
  end

  def self.deliver(api_key, api_secret, buzz_key, params = {})
    begin
      parameters = {buzz_key: buzz_key, BUZZBOX_KEY: api_key,BUZZBOX_SECRET: api_secret }
      response = Net::HTTP.post_form(URI.parse(DEFAULT_ENDPOINT), parameters)
      if response.class == Net::HTTPUnauthorized
        return {status: 401}
      end
      return {status: 200}
    rescue => e
      {status: 401}
    end
  end
end
