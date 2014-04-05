class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true

  def set_confirmation_token
    self.confirmation_token =  loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(confirmation_token: random_token)
    end
  end
end
