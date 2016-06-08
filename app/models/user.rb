class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
  validates :first_name, presence: true
  validates :username, presence: true, uniqueness: true

  # has_many
  # has_many
  has_secure_password

end
