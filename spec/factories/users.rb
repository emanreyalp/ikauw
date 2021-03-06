FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "#{n}_#{Faker::Internet.unique.email}" }
  end

  trait :who_purchased_contents do
    after(:create) do |user|
      create(:purchase, content: create(:movie), user: user)
      create(:purchase, content: create(:season, :with_episodes), user: user)
    end
  end

  trait :who_has_expired_purchase do
    after(:create) do |user|
      create(:expired_purchase, user: user)
    end
  end
end
