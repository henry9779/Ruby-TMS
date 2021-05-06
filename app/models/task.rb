class Task < ApplicationRecord
  # belongs_to :user
  has_many :tags
  paginates_per 7

  validates :title, presence: { message: I18n.t('title.blank') }
  validates :content, presence: { message: I18n.t('content.blank') }
  validates :status, presence: true
  validates :end_at, inclusion: { in: (Date.today..) }, allow_nil: true
  validates :priority, presence: true

  enum status: { pending: 0, in_progress: 1, completed: 2 }
  enum priority: { low: 0, middle: 1, high: 2 }

  include AASM

  aasm column: :status, enum: true do
    state :pending, initial: true
    state :in_progress, :completed

    event :proceed do
      transitions from: :pending, to: :in_progress
    end

    event :complete do
      transitions from: :in_progress, to: :completed
    end

    event :reset do
      transitions form: %i[in_progress completed], to: :pending
    end
  end

  aasm column: :priority do
    state :low, initial: true
    state :middle, :high

    event :to_middle do
      transitions from: %i[low high], to: :middle
    end

    event :to_high do
      transitions from: %i[low middle], to: :high
    end
  end
end
