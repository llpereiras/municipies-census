require 'rails_helper'

RSpec.describe CitizenMailer do
  describe 'update_information' do
    let(:mail) { described_class.update_information }

    it 'renders the headers', :aggregate_failure do
      expect(mail.subject).to eq('Update information')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
