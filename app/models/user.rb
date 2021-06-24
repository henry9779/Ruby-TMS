class User < ApplicationRecord
  has_many :tasks, dependent: :delete_all

  paginates_per 7

  validates :name, presence: { message: I18n.t('name.blank') }

  validates :email,
            presence: { message: I18n.t('email.blank') },
            format: { with: /[\w]+@([\w-]+\.)+[\w-]{2,4}/,
            message: I18n.t('email.format') },
            uniqueness: true

  validates :password,
            presence: { message: I18n.t('password.blank') },
            confirmation: true,
            length: { minimum: 8 }

  enum role: { user: 0, admin: 1 }

  include AASM

  aasm column: :role, enum: true do
    state :user, initial: true
    state :admin

    event :admin do
      transitions from: :user, to: :to_admin
    end

    event :user do
      transitions from: :admin, to: :to_user
    end
  end

  before_create :encrypt_password

  def self.login(user)
    password = Digest::SHA1.hexdigest("r#{user[:password]}y")
    User.find_by(email: user[:email], password: password)
  end

  private

  def encrypt_password
    self.password = Digest::SHA1.hexdigest("r#{self.password}y")
  end
end
