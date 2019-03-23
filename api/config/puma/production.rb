workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
#
# preload_app!

threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
# Min and Max threads per worker
threads threads_count, threads_count


rails_env = ENV.fetch("RAILS_ENV") { "development" }
environment rails_env

# Set up socket location
bind "unix:///tmp/puma.sock"

# Logging
stdout_redirect "/var/log/rails/puma.stdout.log", "/var/log/rails/puma.stderr.log", true

# Set master PID and state locations
pidfile "/tmp/puma.pid"
state_path "/tmp/puma.state"
activate_control_app

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
