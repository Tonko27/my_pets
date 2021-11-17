FactoryBot.define do
  factory :customer do
    name { 'pets_test' }
    nickname { 'pets_test' }
    email { Faker::Internet.email }
    postalcode { '123-4567' }
    prefecture_id { '1' }
    city { 'test' }
    building { 'test' }
    phone { '123-456-789' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end