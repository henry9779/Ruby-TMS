class User < ApplicationRecord
  has_many :tasks

  validates :name, presence: { message: I18n.t('name.blank') }
  validates :email, presence: { message: I18n.t('email.blank') }, uniqueness: true
  validates :password, presence: { message: I18n.t('password.blank') }, confirmation: true
end
