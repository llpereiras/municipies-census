# frozen_string_literal: true

FactoryBot.define do
  factory :citizen do
    association :municipy, factory: :municipy
    name { Faker::Company.name }

    cpf { '32586104447' }
    cns { '879227912880007' }
    email { Faker::Internet.email }
    birthday { Faker::Date }
    phone { Faker::Number }

    after(:build) do |model|
      model.photo.attach(io: File.open(Rails.root.join('spec/factories/images/sun.jpg')), filename: 'sun.jpg', content_type: 'image/jpeg')
    end
  end

  trait :citizen_inactive do
    status { 'inactive' }
  end
end
