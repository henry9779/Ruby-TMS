class Task < ApplicationRecord
  # belongs_to :user
  has_many :tags

  default_scope -> { order('created_at DESC')}
end
