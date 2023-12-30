module Citizens
  class SendEmailJob < ApplicationJob
    queue_as :default

    def perform(citizen)
      CitizenMailer.update_information(citizen).delivery_later
    end
  end
end
