require 'drb/drb'

# The URI to connect to
SERVER_URI="druby://localhost:8787"

# Start a local DRbServer to handle callbacks.
#
# Not necessary for this small example, but will be required
# as soon as we pass a non-marshallable object as an argument
# to a dRuby call.
#
# Note: this must be called at least once per process to take any effect.
# This is particularly important if your application forks.
DRb.start_service

puts "Connecting to server at #{SERVER_URI}"

server = DRbObject.new_with_uri(SERVER_URI)
(1..5).each do
  puts server.do_stuff
  sleep 5
end
