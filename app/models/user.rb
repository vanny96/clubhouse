class User < ApplicationRecord
  validates :name, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/,
                                    message: "Only allows letters and numbers" }
  validates :email, presence: true, format: 
                                    { with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,6}\z/i},
                                    uniqueness: true
  
  has_secure_password
  has_many :posts
end
