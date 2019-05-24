class User < ApplicationRecord
  has_many :purchases, lambda { active }
  has_many :all_purchases, class_name: 'Purchase'
  has_many :contents, through: :purchases do
  # This is so hacky. I will refactor it.
    def with_remaining_time
      select(<<~SQL)
        INTERVAL '#{Purchase::ACTIVATION_PERIOD_TIME / 1.day} DAY' - ('#{Time.now}' - contents.created_at) AS remaining_time,
        *,
        contents.id AS id
      SQL
    end
  end
end
