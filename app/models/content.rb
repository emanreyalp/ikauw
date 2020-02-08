class Content < ApplicationRecord
  scope :movies_and_seasons, lambda { where(type: 'Movie').or(where(type: 'Season')) }

  validates :plot, presence: true
  validates :title, presence: true

  def initialize(*args)
    raise 'Cannot directly instantiate a Content' if self.class == Content
    super
  end
end
