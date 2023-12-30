module Citizens
  class SendCommunicationJob < ApplicationJob
    queue_as :default

    def perform(citizen)
      SendSmsJob.perform(citizen.phone, 'Welcome')
      SendEmailJob.perform(citizen.email, 'Welcome')
    end
  end
end
