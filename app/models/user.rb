class User < ActiveRecord::Base

	validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }

  before_save :encrypt_password

  private

    def encrypt_password
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      string # Only a temporary implementation!
    end


  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

end
