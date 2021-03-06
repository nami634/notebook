class User < ActiveRecord::Base
  before_save { email.downcase! }
  has_many :notes
  has_many :categories
  has_many :note_processes

  has_secure_password

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with:/.+@.+/ }
  validates :password,
    length: {in: 5..12}

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
end