FactoryBot.define do
  factory :purchase do
    from_date { Time.now }
    user
    content { build(:movie) }
    purchase_option
  end
end
