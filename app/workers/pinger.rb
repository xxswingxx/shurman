class Pinger
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { hourly.minute_of_hour(0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55) }

  def perform
    response = HTTParty.get 'http://www.forocoches.com/foro/register.php'
    match = response.parsed_response.encode('utf-8').match(/INVITACIÓN REQUERIDA PARA NUEVOS REGISTROS/)
    UserMailer.notify_good_news.deliver
  end
end