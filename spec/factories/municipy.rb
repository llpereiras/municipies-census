# frozen_string_literal: true

FactoryBot.define do
  factory :municipy do
    name { Faker::Company.name }
  end

  trait :inactive do
    status { 'inactive' }
  end
end
