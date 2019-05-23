class User < ApplicationRecord
  has_many :purchases, lambda { active }
  has_many :all_purchases, class_name: 'Purchase'
  has_many :contents, through: :purchases
end
