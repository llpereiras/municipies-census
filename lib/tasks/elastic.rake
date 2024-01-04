namespace :search do
  desc 'Create the Elasticsearch index'
  task create_index: :environment do
    puts 'starting [search:create_index]'
    Search::ElasticRepository.create_index
    puts 'done [search:create_index]'
  end

  desc 'Populate the Elasticsearch index'
  task populate_index: :environment do
    puts 'starting [search:populate_index]'
    Citizen.find_each do |citizen|
      Search::ElasticRepository.insert(citizen.id, citizen.attributes)
    end
    puts 'done [search:populate_index]'
  end
end
