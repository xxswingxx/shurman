class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def send_confirmation(user)
  	mail(to: user.email, subject: 'Confirma tu cuenta, shur.')
  end

  def notitfy_good_news!
  	mail(to: user.email, subject: '¡Foroches ha abierto el registro!')
  end
end
