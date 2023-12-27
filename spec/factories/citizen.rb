# frozen_string_literal: true

FactoryBot.define do
  factory :citizen do
    association :municipy, factory: :municipy
    name { Faker::Company.name }

    cpf { '32586104447' }
    cns { '879227912880007' }
    email { Faker::Internet.email }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    phone { Faker::Number.to_s }
    photo { Rack::Test::UploadedFile.new('spec/factories/images/sun.jpg', 'image/png') }
  end

  trait :citizen_inactive do
    status { 'inactive' }
  end
end
