class User < ApplicationRecord
  has_many :purchases
  has_many :contents, through: :purchases

  validates :email, presence: true
end
