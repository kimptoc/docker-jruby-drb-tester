require 'drb/drb'

# The URI for the server to connect to
URI="druby://localhost:8787"

class DrbServer

  def do_stuff(message)
    return message.length
  end

end

# The object that handles requests on the server
FRONT_OBJECT=DrbServer.new

$SAFE = 1   # disable eval() and friends

puts "Starting DrbServer on #{FRONT_OBJECT}"

DRb.start_service(URI, FRONT_OBJECT)
# Wait for the drb server thread to finish before exiting.
DRb.thread.join
