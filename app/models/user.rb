class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :name, :message => "Username already in use, choose another"

  has_many :change_histories
end
