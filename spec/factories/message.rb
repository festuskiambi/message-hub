FactoryBot.define do
  factory :message do
    originator { Faker::Name.name }
    recipient { Faker::Name.name }
    content { Faker::Lorem.paragraph_by_chars(256, false) }
  end
end
