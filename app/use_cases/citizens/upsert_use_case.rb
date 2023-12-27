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
      if @params[:id]
        @citizen = Citizen.find(@params[:id])
        @citizen.update!(@params)
        @citizen.reload
        return
      end

      @citizen = ::Citizen.create!(@params)
    end
  end
end
