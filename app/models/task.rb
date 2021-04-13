class Task < ApplicationRecord
  # belongs_to :user
  has_many :tags

  scope :show_desc, -> { order(created_at: :desc) }

  validates :title, :presence => { :message => I18n.t('title.blank') }
  validates :content, :presence => { :message => I18n.t('content.blank') }
  validates :status, presence: true

  enum status: { pending: 0, proceeding: 1, complete: 2 }

  include AASM

  aasm column: :status, enum: true, skip_validation_on_save: true do
    state :pending, initial: true
    state :proceeded, :completed

    event :proceeding do
      transitions from: :pending, to: :proceeded
    end

    event :complete do
      transitions from: :proceeded, to: :completed
    end
  end
end
