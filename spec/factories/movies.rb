FactoryBot.define do
  factory :movie do
    title { Faker::Book.unique.title }
    plot { Faker::Lorem.paragraph(sentence_count: 2) }
  end
end
