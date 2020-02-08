FactoryBot.define do
  factory :season do
    title { Faker::DcComics.title }
    plot { Faker::Lorem.sentences(number: 4).join(' ') }
  end

  trait :with_episodes do
    after(:create) do |season|
      3.times { create(:episode, season: season) }
    end
  end
end
