class User < ApplicationRecord
  has_many :api_keys
  validates_presence_of :email, :password_digest
  validates_uniqueness_of :email

  has_secure_password
end
