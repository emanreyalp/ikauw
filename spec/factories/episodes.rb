FactoryBot.define do
  factory :episode do
    season

    title { 'Episode Title' }
    plot { 'A boring plot' }

    number { 1 }
  end
end
