class Consumer < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation

  validates_uniqueness_of :email

  before_create :generate_access_token
  
  private
    def generate_access_token
      begin
        self.access_token = SecureRandom.hex
      end while self.class.exists?(access_token: access_token)
    end
end
