class Task < ApplicationRecord
  include AASM

  aasm :column => 'state' do
    state :pending, initial: true
    state :progressing, :finishing

    event :progress do
      transitions from: [:pending, :finishing], to: :progressing
    end

    event :finish do
      transitions from: [:progressing, :pending], to: :finishing
    end

    event :pend do
      transitions from: [:progressing, :finishing], to: :pending
    end
  end

  # belongs_to :user
  has_many :tags

  scope :show_desc, -> { order(created_at: :desc) }

  validates :title, :presence => { :message => I18n.t('title.blank') }
  validates :content, :presence => { :message => I18n.t('content.blank') }
end
