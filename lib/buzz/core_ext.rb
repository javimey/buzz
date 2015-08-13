require 'rest-client'

module Buzz
    def self.deliver(buzz_key, params = {})
      begin
        parameters = {buzz_key: buzz_key }
        response = RestClient::Request.execute(method: :post, url: BUZZ_INCOMING_URL,
                            :buzz_key => buzz_key, params: params, headers: {:Authorization => 'Bearer cT0febFoD5lxAlNAXHo6g', :user_agent => "API_SECRET"})

      rescue RestClient::ExceptionWithResponse => e
        if (e.class == RestClient::Unauthorized)
          {status: 401}
        end
      end
    end
end
