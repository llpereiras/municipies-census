class CitizenMailer < ApplicationMailer
  def update_information(email)
    @email = email

    mail to: @email
  end
end
