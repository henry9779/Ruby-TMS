class Task < ApplicationRecord
  # belongs_to :user
  has_many :tags

  default_scope -> { order('created_at DESC')}

  validates :title, :presence => { :message => I18n.t('title.blank') }
  validates :content, :presence => { :message => I18n.t('content.blank') }
end
