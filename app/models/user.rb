class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  
  before_validation { email.downcase! }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  has_secure_password
  validates :password, length: { minimum: 6 }
  has_many :tasks
end
