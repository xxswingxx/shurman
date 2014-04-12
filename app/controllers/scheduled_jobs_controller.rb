class ScheduledJobsController < ApplicationController
  
  def ping
  	Pinger.new.async.perform
  	render nothing: true, status: 200
  end
end