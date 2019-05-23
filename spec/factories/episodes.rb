FactoryBot.define do
  factory :episode do
    season

    title { Faker::Book.title }
    plot { Faker::Movie.quote }

    sequence(:number) { |n| n }
  end
end
