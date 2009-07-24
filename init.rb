require File.dirname(__FILE__) + '/lib/delayed_job'
Delayed::Job.destroy_successful_jobs = false
