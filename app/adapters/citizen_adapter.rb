# frozen_string_literal: true

class CitizenAdapter
  def self.from_elastic(documents)
    Array(documents).map do |citizen|
      Citizen.new(citizen['_source'])
    end
  end
end
