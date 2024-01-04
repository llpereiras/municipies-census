# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MunicipiesQuery do
  let(:params) { {} }
  let(:query) { described_class.call(params:) }
  let(:municipies) { create_list(:municipy, 3) }

  describe '#apply_filters' do
    context 'when id is present' do
      let(:params) { { id: municipies.last.id } }

      it 'filters by id' do
        expect(query.size).to eq(1)
      end
    end

    context 'when id is blank' do
      it 'does not filter by id' do
        municipies

        expect(query.size).to eq(municipies.size)
      end
    end

    context 'when name_start is present' do
      let(:params) { { name_start: 'São' } }
      let(:municipy1) { create(:municipy, name: 'São Paulo') }
      let(:municipy2) { create(:municipy, name: 'São Bernardo') }
      let(:municipy3) { create(:municipy, name: 'Rio de Janeiro') }

      it 'filters by name start' do
        municipy1
        municipy2
        municipy3
        expect(query).to contain_exactly(municipy1, municipy2)
      end
    end
  end
end
