# frozen_string_literal: true

require 'opensearch'

module Search
  class BaseRepository
    class << self
      def client
        host = URI.parse(ENV.fetch('ELASTIC_URL', 'http://localhost:9200'))
        OpenSearch::Client.new(
          host:
        )
      end
    end
  end
end
