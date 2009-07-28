class CreateDelayedJobs < ActiveRecord::Migration
  def self.up
    create_table :delayed_jobs, :force => true do |t|
      t.integer  :priority, :default => 0      # Allows some jobs to jump to the front of the queue
      t.integer  :attempts, :default => 0      # Provides for retries, but still fail eventually.
      t.text     :handler                      # YAML-encoded string of the object that will do work
      t.text     :last_error                   # reason for last failure (See Note below)
      t.string   :locked_by                    # Who is working on this object (if locked)
      t.datetime :run_at                       # When to run. Could be Time.now for immediately, or sometime in the future.
      t.datetime :locked_at                    # Set when a client is working on this object
      t.datetime :failed_at                    # Set when all retries have failed (actually, by default, the record is deleted instead)
      t.datetime :first_started_at             # Needed for task tracking
      t.datetime :last_started_at              # Needed for task tracking
      t.datetime :finished_at                  # Needed for when you are not deleting items from the table on completion
      t.float    :completion_time              # Time in seconds that it took for the job to complete
      t.float    :time_in_queue                # Time in seconds that the item sat in queue
      t.string   :completed_by                 # The name of the worker that completed the job
      t.timestamps
    end

  end
  
  def self.down
    drop_table :delayed_jobs  
  end
end