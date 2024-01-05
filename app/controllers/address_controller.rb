# frozen_string_literal: true

class AddressController < ApplicationController
  def create
    Adrress.create!(upsert_params)
    render json: {}, status: :created
  end


  private

  def upsert_params
    params.require(:address)
          .permit(:zip_code, :street, :complement, :neighborhood, :city, :state, :ibge_code)
          .merge(municipy_id: params[:municipy_id], id: params[:id]).compact_blank
  end
end
