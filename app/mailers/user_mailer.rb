class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def send_confirmation(user)
    @user = user
    mail(to: user.email, subject: 'Confirma tu cuenta, shur.').deliver
  end

  def notify_good_news
    User.where('confirmed_at is not null').pluck(:email).each do |email|
      mail(to: email, subject: '¡Foroches ha abierto el registro!').deliver
    end
  end
end
