# frozen_string_literal: true

class MunicipiesController < ApplicationController
  def index
    @municipies = MunicipiesQuery.call(params: search_params)
  end

  def new
    @municipy = Municipy.new
  end

  def edit
    @municipy = MunicipiesQuery.call(params: { id: params[:id] }).first
  end

  def create
    Municipies::UpsertUseCase.call(upsert_params)

    redirect_to root_path
  end

  def update
    Municipies::UpsertUseCase.call(upsert_params)

    redirect_to root_path
  end

  def inactive
    Municipies::InactiveUseCase.call(params[:id])

    redirect_to root_path
  end

  private

  def upsert_params
    params.require(:municipy).permit(:name, :status).merge(id: params[:id]).compact_blank
  end

  def search_params
    params.permit(:name_start).merge(order: 'name_asc')
  end
end
