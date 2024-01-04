# frozen_string_literal: true

module Twilio
  class SmsRepository < BaseRepository
    class << self
      def send_sms(from, to, body)
        http_client.messages.create(
          from:,
          to:,
          body:
        )
      rescue Twilio::REST::RestError
        Rails.logger.error('Authentication Error - invalid username')
      end
    end
  end
end
