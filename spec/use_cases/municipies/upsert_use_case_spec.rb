# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Municipies::UpsertUseCase do
  let(:params) { attributes_for(:municipy) }
  let(:use_case) { described_class.call(params) }

  describe '#call' do
    context 'when id is present' do
      let(:municipy) { create(:municipy) }
      let(:params) { attributes_for(:municipy, id: municipy.id, name: 'New Name') }

      it 'updates the existing municipy' do
        expect { use_case }.to change { municipy.reload.name }.to('New Name')
      end

      it 'returns the updated municipy' do
        expect(use_case).to eq(municipy)
      end
    end

    context 'when id is blank' do
      it 'creates a new municipy' do
        expect { use_case }.to change(Municipy, :count).by(1)
      end

      it 'returns the new municipy' do
        expect(use_case).to be_a(Municipy)
      end
    end
  end
end
