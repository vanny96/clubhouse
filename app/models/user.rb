class User < ApplicationRecord
  attr_accessor :remember_token

  before_create {self.email.downcase!}

  validates :name, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/,
                                    message: "Only allows letters and numbers" }
  validates :email, presence: true, format: 
                                    { with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,6}\z/i},
                                    uniqueness: true
  
  has_secure_password
  has_many :posts

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def create_remember_token
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(self.remember_token))
  end

  def authenticate? attribute, token
  digest = self.send("#{attribute}_digest")
  return false if digest.nil?
  BCrypt::Password.new(digest).is_password?(token)
  end
end
