class SeasonSerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true, cache_length: 12.hours
  attributes :title, :plot, :created_at

  has_many :episodes
end
