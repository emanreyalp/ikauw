FactoryBot.define do
  factory :purchase do
    from_date { Time.now }
    expiration_date { Time.now + Purchase::ACTIVATION_PERIOD_TIME }
    user
    content { build(:movie) }
    purchase_option
  end
end
