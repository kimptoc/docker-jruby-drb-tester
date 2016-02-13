require 'drb/drb'

java_import java.lang.System

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

$min = 1000000
$tot = 0
$max = 0
$runs = 1000

$message_size = 10000

def time_this(id)
  start = System.nano_time
  yield
  elapsed = (System.nano_time - start) / 1000000.0
  $tot += elapsed
  $min = elapsed if elapsed < $min
  $max = elapsed if elapsed > $max
  puts "Run #{id} %.4f ms" % elapsed if elapsed > 30
end

puts "Connecting to server at #{SERVER_URI}"

start_time = Time.now

server = DRbObject.new_with_uri(SERVER_URI)
puts "Testing with string of #{$message_size} chars"
(1..$runs).each do |i|
  x = nil
  a_string = rand(36**$message_size).to_s(36)
  time_this i do
   x = server.do_stuff a_string
  end
#  puts x
#  sleep 5
end

puts "For #{$runs} runs, overall elapsed:#{Time.now - start_time}s. Min:#{$min.round(4)}ms, Avg:#{($tot / $runs).round(4)}ms, Max:#{$max.round(4)}ms"