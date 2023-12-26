# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Municipy do
  let(:model) { described_class.create!(params) }
  let(:municipies) { create_list(:municipy, 3) }

  describe '#create' do
    context 'when validate name' do
      let(:params) { { name: nil } }

      it 'return a validator error' do
        expect { model }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
