# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CitizensQuery do
  let(:params) { {} }
  let(:query) { described_class.call(params:) }
  let(:citizens) { create_list(:citizen, 3) }

  describe '#apply_filters' do
    context 'when id is present' do
      let(:params) { { id: citizens.last.id } }

      it 'filters by id' do
        expect(query.size).to eq(1)
      end
    end

    context 'when id is blank' do
      it 'does not filter by id' do
        citizens

        expect(query.size).to eq(citizens.size)
      end
    end

    context 'when name_start is present' do
      let(:params) { { name_start: 'São' } }
      let(:citizen1) { create(:citizen, name: 'São Paulo') }
      let(:citizen2) { create(:citizen, name: 'São Bernardo') }
      let(:citizen3) { create(:citizen, name: 'Rio de Janeiro') }

      it 'filters by name start' do
        citizen1
        citizen2
        citizen3
        expect(query).to match_array([citizen1, citizen2])
      end
    end
  end
end
