# frozen_string_literal: true

class CitizensController < ApplicationController
  def index
    search = Search::ElasticRepository.search(search_params[:name_start])
    @citizens = CitizenAdapter.from_elastic(search)
  end

  def new
    @municipy = Municipy.find(params[:municipy_id])
    @citizen = Citizen.new(municipy: @municipy)
  end

  def edit
    @municipy = Municipy.find(params[:municipy_id])
    @citizen = CitizensQuery.call(params: { id: params[:id] }).first
  end

  def create
    Citizens::UpsertUseCase.call(upsert_params)

    redirect_citizens_index
  end

  def update
    Citizens::UpsertUseCase.call(upsert_params)

    redirect_citizens_index
  end

  def inactive
    Citizens::InactiveUseCase.call(params[:id])

    redirect_citizens_index
  end

  private

  def redirect_citizens_index
    redirect_to municipy_citizens_url(params[:municipy_id])
  end

  def upsert_params
    params.require(:citizen)
          .permit(:name, :status, :cpf, :cns, :email, :birthday, :phone, :photo, :municipy_id)
          .merge(municipy_id: params[:municipy_id], id: params[:id]).compact_blank
  end

  def search_params
    params.permit(:name_start).merge(order: 'name_asc')
  end
end
