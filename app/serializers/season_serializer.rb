class SeasonSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :plot, :created_at

  has_many :episodes
end
