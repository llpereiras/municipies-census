# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CitizensController' do
  let(:citizen) { create(:citizen) }
  let(:valid_attributes) { attributes_for(:citizen) }
  let(:invalid_attributes) { attributes_for(:citizen, name: nil) }

  describe 'GET /citizens' do
    it 'renders the index template' do
      get "/municipes/#{citizen.municipy_id}/citizens"

      expect(response).to render_template(:index)
    end

    it 'assigns all citizens as @citizens' do
      municipy = create(:municipy, name: 'São Paulo')

      get municipy_citizens_path

      expect(assigns(:citizens)).to eq([municipy])
    end

    it 'filters citizens by name start' do
      municipy1 = create(:municipy, name: 'São Paulo')
      municipy2 = create(:municipy, name: 'São Bernardo')
      create(:municipy, name: 'Rio de Janeiro')
      get municipy_citizens_path, params: { name_start: 'São' }
      expect(assigns(:citizens)).to match_array([municipy1, municipy2])
    end
  end

  describe 'GET /citizens/new' do
    it 'renders the new template' do
      get new_municipy_path
      expect(response).to render_template(:new)
    end

    it 'assigns a new municipy as @municipy' do
      get new_municipy_path
      expect(assigns(:municipy)).to be_a_new(Municipy)
    end
  end

  describe 'POST /citizens' do
    context 'with valid params' do
      it 'creates a new Municipy' do
        expect do
          post municipy_citizens_path, params: { municipy: valid_attributes }
        end.to change(Municipy, :count).by(1)
      end

      it 'redirects to the root path' do
        post municipy_citizens_path, params: { municipy: valid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Municipy' do
        expect do
          post municipy_citizens_path, params: { municipy: invalid_attributes }
        end.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  describe 'GET /citizens/:id/edit' do
    it 'renders the edit template' do
      get edit_municipy_path(municipy)
      expect(response).to render_template(:edit)
    end

    it 'assigns the requested municipy as @municipy' do
      get edit_municipy_path(municipy)
      expect(assigns(:municipy)).to eq(municipy)
    end
  end

  describe 'PUT /citizens/:id' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for(:municipy, name: 'New Name') }

      it 'updates the requested municipy' do
        put municipy_path(municipy), params: { municipy: new_attributes }
        municipy.reload
        expect(municipy.name).to eq('New Name')
      end

      it 'redirects to the root path' do
        put municipy_path(municipy), params: { municipy: valid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'POST /citizens/:id/inactive' do
    it 'changes the status of the municipy to inactive' do
      post inactive_municipy_path(municipy)
      municipy.reload
      expect(municipy.status).to eq('inactive')
    end

    it 'redirects to the root path' do
      post inactive_municipy_path(municipy)
      expect(response).to redirect_to(root_path)
    end
  end
end
