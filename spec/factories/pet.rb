FactoryBot.define do
  factory :pet do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/cat.jpg')) }
    gender_id { '1' }
    category_id { '1' }
    breed { '1' }
    age_id { '1' }
    character { 'test' }
    reason { 'test' }
    customer
  end
end
