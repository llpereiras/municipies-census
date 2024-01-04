module Search
  class ElasticRepository < BaseRepository
    class << self
      INDEX = 'municipies-census'.freeze

      def create_index
        body = {
          settings: {
            index: {
              number_of_shards: 1,
              number_of_replicas: 2
            }
          }
        }

        client.indices.create(
          index: INDEX,
          body:
        )
      end

      def insert(id, body)
        client.index(
          index: INDEX,
          body:,
          id:,
          refresh: true
        )
      end

      def search(search)
        query = {
          size: 5,
          query: {
            multi_match: {
              query: search,
              fields: ['name^2', 'director']
            }
          }
        }

        client.search(
          body: search ? query : {},
          index: INDEX
        )['hits']['hits']
      end
    end
  end
end
