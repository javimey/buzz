module Buzz
  class Configuration

    attr_accessor :buzz_api_key
    attr_accessor :buzz_secret_token
    attr_accessor :endpoint

    DEFAULT_ENDPOINT = 'http://buzzerbox.herokuapp.com/api/'

    def initialize
      @endpoint = DEFAULT_ENDPOINT
    end
  end
end
