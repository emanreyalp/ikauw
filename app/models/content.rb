class Content < ApplicationRecord
  def initialize(*args)
    raise 'Cannot directly instantiate a Content' if self.class == Content
    super
  end
end
