# config/unicorn.rb
worker_processes Integer(2)
timeout 30
preload_app true
@sidekiq_pid = nil

before_fork do |server, worker|

  @sidekiq_pid ||= spawn("bundle exec sidekiq -c 2")
  Rails.logger.info('Spawned sidekiq #{@@sidekiq_pid}')

  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end