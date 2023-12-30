module Citizens
  class SendSmsJob < ApplicationJob
    queue_as :default

    PHONE_SEND = ENV.fetch('PHONE_SEND', '+551111111111')

    def perform(to, message)
      Twilio::SmsRepository.send_sms(PHONE_SEND, to, message)
    end
  end
end
