class User < ActiveRecord::Base
  has_secure_password
  has_many :friendships
  has_many :friends, class_name: "User", foreign_key: "friend_id", :through => :friendships
  has_many :invites
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :email, :password, :description, presence: true
  validates :email, format: { with: email_regex }, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true, length: { minimum: 8 }
end
