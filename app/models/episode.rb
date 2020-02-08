class Episode < Content
  belongs_to :season

  validates :number, presence: true
end
