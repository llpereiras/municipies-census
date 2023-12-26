# frozen_string_literal: true

module Municipies
  class InactiveUseCase < ApplicationUseCase
    def initialize(municipy_id)
      @municipy_id = municipy_id
    end

    def call
      log_inactive
      inactive_municipy

      @municipy
    end

    private

    attr_reader :municipy_id

    def inactive_municipy
      Municipy.find(municipy_id).update(status: 'inactive')
    end

    def log_inactive
      # TODO: implement log of inactivit
    end
  end
end
