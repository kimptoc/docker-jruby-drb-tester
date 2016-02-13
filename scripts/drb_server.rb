require 'drb/drb'

java_import java.lang.System

require_relative 'common'

# The URI for the server to connect to
URI="druby://0.0.0.0:8787"

class DrbServer

  def do_stuff(message)
    return message.length
  end

end

# The object that handles requests on the server
FRONT_OBJECT=DrbServer.new

$SAFE = 1   # disable eval() and friends

log "Starting DrbServer on #{FRONT_OBJECT}"

start = System.nano_time
total = 0

(0..10).each do |i|
    Thread.new do
      log "Busy thread #{i} started"
      while (System.nano_time - start) / 1000000000 < 60
        total += (System.nano_time * rand(System.nano_time)) / 1000000000000
      end
      log "Busy thread #{i} finished"
    end
end

DRb.start_service(URI, FRONT_OBJECT)
# Wait for the drb server thread to finish before exiting.
DRb.thread.join
