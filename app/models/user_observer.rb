class UserObserver < ActiveRecord::Observer
  def after_create(user)
    UserMailer.send_confirmation(user)
  end
end