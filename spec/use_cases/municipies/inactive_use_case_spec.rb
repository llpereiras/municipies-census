# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Municipies::InactiveUseCase, type: :use_case do
  let(:municipy) { create(:municipy, status: 'active') }
  let(:use_case) { described_class.call(municipy.id) }

  describe '#call' do
    it 'changes the status of the municipy to inactive' do
      expect { use_case }.to change { municipy.reload.status }.to('inactive')
    end

    xit 'logs the inactivity of the municipy' do
      # TODO: implement the expectation for the log
    end
  end
end
