class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :content
  belongs_to :purchase_option

  validates_uniqueness_of :user_id, scope: [:content_id, :purchase_option_id]
  validate :not_episode

  scope :active_in_time, lambda { |activation_period_time|
    where('from_date >= ?', Time.now - activation_period_time) }
  scope :active, lambda { active_in_time(ACTIVATION_PERIOD_TIME) }

  ACTIVATION_PERIOD_TIME = 2.day

  private

  def not_episode
    errors.add(:content, "can't be Episode") if content.class == Episode
  end
end
