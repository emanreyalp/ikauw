class LibraryContentSerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true, cache_length: 12.hours

  attribute :title do |purchase|
    purchase.content.title
  end
  attribute :plot do |purchase|
    purchase.content.plot
  end
  attribute :created_at do |purchase|
    purchase.content.created_at
  end
  attribute :remaining_time_in_days do |purchase|
    purchase.remaining_time_in_days
  end
  attribute :type do |purchase|
    purchase.content.type
  end
end
