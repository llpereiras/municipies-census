# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CitizensController' do
  let(:citizen) { create(:citizen) }
  let(:valid_attributes) { attributes_for(:citizen) }
  let(:invalid_attributes) { attributes_for(:citizen, name: nil) }

  describe 'GET /citizens' do
    it 'renders the index template' do
      get municipy_citizens_path({ municipy_id: citizen.municipy_id })

      expect(response).to render_template(:index)
    end

    it 'assigns all citizens as @citizens' do
      citizen = create(:citizen, name: Faker::Name.name)
      search = ['_source' => citizen.attributes]

      allow(Search::ElasticRepository).to receive(:search).and_return(search)

      get municipy_citizens_path({ municipy_id: citizen.municipy_id })

      expect(assigns(:citizens)).to eq([citizen])
    end
  end

  describe 'GET /citizens/new' do
    it 'renders the new template' do
      get new_municipy_citizen_path(citizen.municipy_id)
      expect(response).to render_template(:new)
    end

    it 'assigns a new citizen as @citizen' do
      get new_municipy_citizen_path(citizen.municipy_id)
      expect(assigns(:citizen)).to be_a_new(Citizen)
    end
  end

  describe 'POST /citizens' do
    context 'with valid params' do
      xit 'creates a new Citizen' do
        expect do
          post municipy_citizens_path(citizen.municipy_id), params: { citizen: valid_attributes }
        end.to change(Citizen, :count).by(1)
      end

      it 'redirects to the root path' do
        post municipy_citizens_path(citizen.municipy_id), params: { citizen: valid_attributes }
        expect(response).to redirect_to(municipy_citizens_path(citizen.municipy_id))
      end
    end

    context 'with invalid params' do
      it 'does not create a new Citizen' do
        expect do
          post municipy_citizens_path(citizen.municipy_id), params: { citizen: invalid_attributes }
        end.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  describe 'GET /citizens/:id/edit' do
    it 'renders the edit template' do
      get edit_municipy_citizen_path(citizen.municipy_id, citizen.id)
      expect(response).to render_template(:edit)
    end

    it 'assigns the requested citizen as @citizen' do
      get edit_municipy_citizen_path(citizen.municipy_id, citizen.id)
      expect(assigns(:citizen)).to eq(citizen)
    end
  end

  describe 'PUT /citizens/:id' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for(:citizen, name: 'New Name') }

      it 'updates the requested citizen' do
        put municipy_citizen_path(citizen.municipy_id, citizen.id), params: { citizen: new_attributes }
        citizen.reload
        expect(citizen.name).to eq('New Name')
      end

      it 'redirects to the root path' do
        citizen = create(:citizen, name: Faker::Name.name)

        put municipy_citizen_path(citizen.municipy_id, citizen.id), params: { citizen: valid_attributes }

        expect(response).to redirect_to(municipy_citizens_path(citizen.municipy_id))
      end
    end
  end
end
