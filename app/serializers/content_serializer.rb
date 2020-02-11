class ContentSerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true, cache_length: 12.hours
  attributes :title, :plot, :created_at

  attribute :type do |content|
    content.type
  end
end
