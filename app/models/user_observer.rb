class UserObserver < ActiveRecord::Observer
  def after_save(user)
  	debugger
    UserMailer.send_confirmation(user).deliver
  end
end