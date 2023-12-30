# frozen_string_literal: true

module Twilio
  class BaseRepository
    class << self
      def http_client
        # Your Account SID from console.twilio.com
        account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
        # API Key from twilio.com/console/project/api-keys
        api_key_sid =  ENV.fetch('TWILIO_SID', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy')
        api_key_secret = ENV.fetch('TWILIO_SECRET', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz')

        # set up a client to talk to the Twilio REST API using an API Key
        @http_client = Twilio::REST::Client.new api_key_sid, api_key_secret, account_sid
      end
    end
  end
end
