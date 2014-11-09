class User < ActiveRecord::Base
  include Following

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :admin, inclusion: [true, false]

  has_many :shouts, dependent: :destroy
end
