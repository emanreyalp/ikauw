class PurchaseOption < ApplicationRecord
  validates :price, presence: true
  validates :quality, presence: true
end
