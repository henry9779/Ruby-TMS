class Task < ApplicationRecord
  # belongs_to :user
  has_many :tags

  scope :show_desc, -> { order(created_at: :desc) }

  validates :title, presence: { message: I18n.t('title.blank') }
  validates :content, presence: { message: I18n.t('content.blank') }
  validates :status, presence: true
  validates :end_at, inclusion: { in: (Date.today..) }, allow_nil: true

  enum status: { pending: 0, in_progress: 1, completed: 2 }

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
end
