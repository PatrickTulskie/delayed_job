# Load the main delayed_job file
require File.dirname(__FILE__) + '/lib/delayed_job'

# Default config data
Delayed::Job.destroy_successful_jobs = false

# Load all of the jobs from the app/jobs directory if this is a rails application.
if defined?(RAILS_ROOT) && File.exists?("#{RAILS_ROOT}/app/jobs")
  Dir.glob("#{RAILS_ROOT}/app/jobs/*").each { |job| require job }
end
