class User < ApplicationRecord
  # callback
  before_save { self.email = self.email.downcase }

  # validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name,     presence: true,
                       length: { maximum: 50 }
  validates :email,    presence: true,
                       length: { maximum: 255 },
                       format: { with: VALID_EMAIL_REGEX },
                       uniqueness: true
  validates :password, presence: true,
                       length: { minmum: 6 }
  # methods
  has_secure_password
end
