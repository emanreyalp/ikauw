class Season < Content
  has_many :episodes, lambda { order(:number) }
end
