# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Citizen do
  let(:citizen) { build(:citizen) }

  it { is_expected.to belong_to(:municipy) }
  it { is_expected.to have_one_attached(:photo) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:phone) }

  it { expect(citizen).to allow_value('user@example.com').for(:email) }
  it { expect(described_class.statuses).to eq('active' => 'active', 'inactive' => 'inactive') }

  describe '#cpf_validator' do
    let(:citizen) { build(:citizen) }

    context 'when cpf is valid' do
      it 'does not add errors to cpf' do
        citizen.cpf = '111.444.777-35'
        citizen.valid?
        expect(citizen.errors[:cpf]).to be_empty
      end
    end

    context 'when cpf is invalid' do
      it 'adds errors to cpf' do
        citizen.cpf = '111.444.777-36'
        citizen.valid?
        expect(citizen.errors[:cpf]).to include('is invalid')
      end
    end
  end

  describe '#cns_validator' do
    let(:citizen) { build(:citizen) }

    context 'when cns is valid' do
      it 'does not add errors to cns' do
        citizen.cns = '204861233640001'
        citizen.valid?
        expect(citizen.errors[:cns]).to be_empty
      end
    end

    context 'when cns is invalid' do
      it 'adds errors to cns' do
        citizen.cns = '8980000 0000 0002'
        citizen.valid?
        expect(citizen.errors[:cns]).to include('is invalid')
      end
    end
  end

  describe '#birthday?' do
    let(:citizen) { build(:citizen) }

    context 'when birthday is blank' do
      it 'returns false' do
        citizen.birthday = nil
        expect(citizen.birthday?).to be false
      end
    end

    context 'when birthday is possible' do
      it 'does not add errors to birthday' do
        citizen.birthday = Date.current - 20.years
        citizen.valid?
        expect(citizen.errors[:birthday]).to be_empty
      end
    end

    context 'when birthday is impossible' do
      it 'adds errors to birthday' do
        citizen.birthday = Date.current - 200.years
        citizen.valid?
        expect(citizen.errors[:birthday]).to include('must be possible')
      end
    end
  end
end
