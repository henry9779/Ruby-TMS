class Task < ApplicationRecord
  # belongs_to :user
  has_many :tags

  scope :show_desc, -> { order(created_at: :desc) }

  validates :title, :presence => { :message => I18n.t('title.blank') }
  validates :content, :presence => { :message => I18n.t('content.blank') }
end
