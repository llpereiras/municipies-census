module Citizens
  class SendCommunicationJob < ApplicationJob
    queue_as :default

    def perform(citizen, message)
      SendSmsJob.perform_now(citizen.phone, message)
      SendEmailJob.perform_now(citizen.email)
    end
  end
end
