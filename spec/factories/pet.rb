FactoryBot.define do
  factory :pet do
    #image_id { 'pets_test' }
    gender_id { '1' }
    category_id { '1' }
    breed { '1' }
    age_id { '1' }
    character { 'test' }
    reason { 'test' }
    customer
  end
end