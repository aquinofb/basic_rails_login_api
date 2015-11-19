class User < ActiveRecord::Base
  include BCrypt

  has_many :api_tokens

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :encrypted_password, presence: true

  def password
    @password ||= Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end
end
