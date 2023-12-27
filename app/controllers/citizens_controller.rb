# frozen_string_literal: true

class CitizensController < ApplicationController
  def index
    @citizens = CitizensQuery.call(params: search_params)
  end

  def new
    @citizen = Citizen.new(municipy: Municipy.find(params[:municipy_id]))
  end

  def create
    Citizens::UpsertUseCase.call(upsert_params)

    redirect_to root_path
  end

  def edit
    @citizen = CitizensQuery.call(params: { id: params[:id] }).first
  end

  def update
    Citizens::UpsertUseCase.call(upsert_params)

    redirect_to root_path
  end

  def inactive
    Citizens::InactiveUseCase.call(params[:id])

    redirect_to root_path
  end

  private

  def upsert_params
    params.require(:citizen)
          .permit(:name, :status, :cpf, :cns, :email, :birthday, :phone, :photo)
          .merge(municipy_id: params[:municipy_id])
  end

  def search_params
    params.permit(:name_start).merge(order: 'name_asc')
  end
end
