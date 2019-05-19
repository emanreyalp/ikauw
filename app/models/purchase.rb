class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :content
  belongs_to :purchase_option
end
