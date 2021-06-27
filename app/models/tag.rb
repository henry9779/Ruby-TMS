class Tag < ApplicationRecord
  has_many :taggings
  has_many :tasks, through: :taggings

  validates :name, presence: true, length: {minimum: 3, maximum: 25}
  validates :name, uniqueness: true
end
