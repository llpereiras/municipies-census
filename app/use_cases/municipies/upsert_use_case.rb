# frozen_string_literal: true

module Municipies
  class UpsertUseCase < ApplicationUseCase
    def initialize(params)
      @params = params
      @municipy = nil
    end

    def call
      create_municipy

      @municipy
    end

    private

    def create_municipy
      if @params[:id].present?
        @municipy = Municipy.find(@params[:id])
        @municipy.update!(@params)
        @municipy.reload
        return
      end

      @municipy = ::Municipy.create!(@params)
    end
  end
end
