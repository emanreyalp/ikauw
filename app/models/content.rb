class Content < ApplicationRecord
  scope :movies_and_seasons, lambda { where(type: 'Movie').or(where(type: 'Season')) }

  def initialize(*args)
    raise 'Cannot directly instantiate a Content' if self.class == Content
    super
  end
end
