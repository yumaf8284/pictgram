class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 8, maximum: 32 }
  validates :name, length: { maximum: 15 }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
  has_secure_password
end
