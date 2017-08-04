class User < ApplicationRecord
	attr_accessor :remember_token, :activation_token
	before_save :downcase_email
  before_create :create_activation_digest

  # User validations
	validates :name,  presence: true,
										length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i							
	validates :email, presence: true,
										length: {maximum: 255},
										format: {with: VALID_EMAIL_REGEX},
										uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true,
  										 length: {minimum: 6},
                       allow_nil: true
  
  # User methods
  def self.digest(string)
  	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

    # To return a random token
  def self.new_token
  	SecureRandom.urlsafe_base64
  end

    # To remember a user in the database for use in persistent sessions
  def remember
  	self.remember_token = User.new_token # this ensures that the assignment sets the user's remember_token attribute
  	update_attribute(:remember_digest, User.digest(remember_token))
  end

    # If token matches digest, returns true
  def authenticated?(remember_token)
    return false if remember_digest.nil?
  	BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  private
    def downcase_email
      self.email = email.downcase
    end
    
    def create_activation_digest
      self.activation_token = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end