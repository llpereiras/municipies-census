# Preview all emails at http://localhost:3000/rails/mailers/citizen
class CitizenPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/citizen/update_information
  def update_information
    CitizenMailer.update_information
  end
end
