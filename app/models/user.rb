class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :name, :message => "Username already in use, choose another"
  validates_uniqueness_of :email, :message => "Email already linked to an account"

  has_many :change_histories
end
