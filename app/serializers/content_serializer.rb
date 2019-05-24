class ContentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :plot, :created_at
end
