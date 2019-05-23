class User < ApplicationRecord
  has_many :purchases
  has_many :contents, through: :purchases
end
