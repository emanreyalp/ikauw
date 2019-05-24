class LibrarySerializer < ContentSerializer
  cache_options enabled: false
  attribute :remaining_time
end
