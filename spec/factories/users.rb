FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "#{n}_#{Faker::Internet.unique.email}" }
  end

  trait :who_purchased_contents do
    after(:build) do |user|
      user.purchases << create(:purchase, content: create(:movie))
      user.purchases << create(:purchase, content: create(:season, :with_episodes))
    end
  end
end
