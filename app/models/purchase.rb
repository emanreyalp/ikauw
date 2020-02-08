class Purchase < ApplicationRecord
  scope :active_in_time, lambda { |activation_period_time|
    where('from_date >= ?', Time.now - activation_period_time) }
  scope :active, lambda { active_in_time(ACTIVATION_PERIOD_TIME) }
  # Expiration calculated from create_at and ACTIVATION_PERIOD_TIME
  # It enaugh to order by create_at
  scope :ordered_by_expiration, lambda { order(:created_at) }

  ACTIVATION_PERIOD_TIME = 2.day

  belongs_to :user
  belongs_to :content
  belongs_to :purchase_option

  validates_uniqueness_of :user_id, scope: [:content_id, :purchase_option_id]
  validate :not_episode

  private

  def not_episode
    errors.add(:content, "can't be Episode") if content.class == Episode
  end
end
