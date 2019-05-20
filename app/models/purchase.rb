class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :content
  belongs_to :purchase_option

  validates_uniqueness_of :user_id, scope: [:content_id, :purchase_option_id]
end
