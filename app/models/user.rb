class User < ApplicationRecord

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password

  before_create :create_api_key

  def self.get_user(info)
    where(email: info[:email]).first_or_initialize do |user|
      user.email = info['email']
      user.password = info['password']
    end
  end

  private 

  def create_api_key
    self.api_key = SecureRandom.urlsafe_base64.to_s if self.api_key.blank?
  end

end