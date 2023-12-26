# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MunicipiesController, type: :request do
  let(:municipy) { create(:municipy) }
  let(:valid_attributes) { attributes_for(:municipy) }
  let(:invalid_attributes) { attributes_for(:municipy, name: nil) }

  describe 'GET /municipies' do
    it 'renders the index template' do
      get municipies_path

      expect(response).to render_template(:index)
    end

    it 'assigns all municipies as @municipies' do
      municipy = create(:municipy, name: 'São Paulo')

      get municipies_path

      expect(assigns(:municipies)).to eq([municipy])
    end

    it 'filters municipies by name start' do
      municipy1 = create(:municipy, name: 'São Paulo')
      municipy2 = create(:municipy, name: 'São Bernardo')
      create(:municipy, name: 'Rio de Janeiro')
      get municipies_path, params: { name_start: 'São' }
      expect(assigns(:municipies)).to match_array([municipy1, municipy2])
    end
  end

  describe 'GET /municipies/new' do
    it 'renders the new template' do
      get new_municipy_path
      expect(response).to render_template(:new)
    end

    it 'assigns a new municipy as @municipy' do
      get new_municipy_path
      expect(assigns(:municipy)).to be_a_new(Municipy)
    end
  end

  describe 'POST /municipies' do
    context 'with valid params' do
      it 'creates a new Municipy' do
        expect do
          post municipies_path, params: { municipy: valid_attributes }
        end.to change(Municipy, :count).by(1)
      end

      it 'redirects to the root path' do
        post municipies_path, params: { municipy: valid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Municipy' do
        expect do
          post municipies_path, params: { municipy: invalid_attributes }
        end.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  describe 'GET /municipies/:id/edit' do
    it 'renders the edit template' do
      get edit_municipy_path(municipy)
      expect(response).to render_template(:edit)
    end

    it 'assigns the requested municipy as @municipy' do
      get edit_municipy_path(municipy)
      expect(assigns(:municipy)).to eq(municipy)
    end
  end

  describe 'PUT /municipies/:id' do
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

  describe 'POST /municipies/:id/inactive' do
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
