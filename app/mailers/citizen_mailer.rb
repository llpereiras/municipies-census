class CitizenMailer < ApplicationMailer
  def update_information(citizen)
    @citizen = citizen

    mail to: @citizen.email
  end
end
