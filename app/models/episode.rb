class Episode < Content
  validates :number, presence: true

  belongs_to :season
end
