class Purchase < ApplicationRecord
  scope :active, -> { where('expiration_date > ?', Time.now) }
  scope :order_by_expiration, -> { order(:expiration_date) }

  ACTIVATION_PERIOD_TIME = 2.day

  belongs_to :user
  belongs_to :content
  belongs_to :purchase_option

  validates_uniqueness_of :user_id, scope: [:content_id, :purchase_option_id]
  validate :not_episode

  def remaining_time_in_days
    (expiration_date - Time.now ) / 1.day
  end

  private

  def not_episode
    errors.add(:content, "can't be Episode") if content.class == Episode
  end
end
