module Citizens
  class SendEmailJob < ApplicationJob
    queue_as :default

    def perform(citizen)
      CitizenMailer.update_information(citizen).deliver_now
    end
  end
end
