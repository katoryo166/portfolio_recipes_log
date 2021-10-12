FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| "example#{n}@example.com" }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }

    password { 'foobar' }
    password_confirmation { 'foobar' }

    trait :admin do
      admin { true }
    end
  end
end
