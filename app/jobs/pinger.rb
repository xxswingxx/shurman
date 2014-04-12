class Pinger
  include SuckerPunch::Job

  def perform
    response = HTTParty.get 'http://www.forocoches.com/foro/register.php'
    match = response.parsed_response.encode('utf-8').match(/INVITACIÓN REQUERIDA PARA NUEVOS REGISTROS/)
    UserMailer.notify_good_news if match.nil?
  end
end