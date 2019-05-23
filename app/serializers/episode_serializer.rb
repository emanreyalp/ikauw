class EpisodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :plot, :number
end
