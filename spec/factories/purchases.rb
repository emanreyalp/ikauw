FactoryBot.define do
  factory :purchase do
    from_date { "2019-05-19 13:14:52" }
    user
    content { build(:movie) }
    purchase_option
  end
end
