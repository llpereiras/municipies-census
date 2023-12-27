# frozen_string_literal: true

module Citizens
  class UpsertUseCase < ApplicationUseCase
    def initialize(params)
      @params = params
      @citizen = nil
    end

    def call
      create_citizen

      @citizen
    end

    private

    def create_citizen
      if @params[:id].nil?
        @citizen = ::Citizen.create!(@params)
      else
        @citizen = Citizen.find_by!(id: @params[:id], municipy_id: @params[:municipy_id])
        @citizen.update!(@params.except(:municipy_id))
        @citizen.reload
      end
    end
  end
end
