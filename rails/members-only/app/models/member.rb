class Member < ApplicationRecord
	before_create :remember
	before_save {self.email = email.downcase}
	has_many :posts
	
	# Member validations
  has_secure_password
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :name,  presence: true,
										length: {maximum: 50}						
	validates :email, presence: true,
										length: {maximum: 255},
										format: {with: VALID_EMAIL_REGEX},
										uniqueness: {case_sensitive: false}
  validates :password, presence: true,
  										 length: {minimum: 6},
                       allow_nil: true

  # métodos de 'member'
  # cria um token randômico (1)
  def self.new_token
  	SecureRandom.urlsafe_base64
  end

  # encripta um token (2)
  def self.digest(token)
  	Digest::SHA1.hexdigest(token.to_s)
  end

  # lembra o 'member' para usar em sessões persistentes (3)
  def remember
  	self.remember_token = Member.digest(Member.new_token)
  end
end
