require "uri"
require "net/http"

module Buzz
  class Notifier
    DEFAULT_ENDPOINT = "https://app.buzzerbox.net/api/track"
    attr_accessor :buzz_api_key
    attr_accessor :buzz_secret_token
    attr_accessor :endpoint

    def initialize
      @endpoint = DEFAULT_ENDPOINT
    end

    class << self


      def self.configure
        configuration.enabled = true if configuration.enabled.nil?
        yield(configuration)
      end

  
      def notify(api_key, api_secret, buzz_key, params = {})
        begin
          parameters = {buzz_key: buzz_key, BUZZBOX_KEY: api_key,BUZZBOX_SECRET: api_secret }
          parameters.merge!(params)
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
  end
end
