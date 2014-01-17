class User < ActiveRecord::Base
	before_save { email.downcase! }
	#before_create :create_remember_token
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  attr_accessor :not_validates_password
  validates :password, length: { minimum: 6 }, unless: :not_validates_password
  has_secure_password

  has_many :user_skills
end
