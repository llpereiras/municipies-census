# frozen_string_literal: true

module Citizens
  module Elastic
    class Populate < ApplicationJob
      queue_as :default

      def perform(citizen)
        Search::ElasticRepository.insert(citizen.id, citizen.attributes)
      end
    end
  end
end
