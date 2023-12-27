# frozen_string_literal: true

module Citizens
  class InactiveUseCase < ApplicationUseCase
    def initialize(citizen_id)
      @citizen_id = citizen_id
    end

    def call
      log_inactive
      inactive_citizen

      @citizen
    end

    private

    attr_reader :citizen_id

    def inactive_citizen
      Citizen.find(citizen_id).update(status: 'inactive')
    end

    def log_inactive
      # TODO: implement log of inactivit
    end
  end
end
