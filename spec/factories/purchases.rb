FactoryBot.define do
  factory :purchase do
    expiration_date { Time.now + Purchase::ACTIVATION_PERIOD_TIME }
    user
    content { build(:movie) }
    purchase_option

    factory :expired_purchase do
      expiration_date { Purchase::ACTIVATION_PERIOD_TIME.ago }
    end
  end
end
