FactoryBot.define do
  factory :season do
    title { Faker::DcComics.title }
    plot { Faker::Lorem.sentences(4).join(' ') }
  end
end
