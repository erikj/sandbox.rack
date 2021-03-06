# maintenance.ru: minimal Rack application to display maintenance message for all requests
# process' start time is displayed as maintenance start time

# USAGE: may be started via rack or unicorn
#   % rackup maintenance.ru
#   % unicorn maintenance.ru
# daemons' options are available
#   % rackup -D -P tmp/pids/maintenance -p 9999 maintenance.ru
#   % unicorn -D -P tmp/pids/maintenance -p 9999 maintenance.ru

require 'rack'

# https://github.com/rack/rack/blob/master/lib/rack/builder.rb

STARTTIME = Time.now

# 503 Service Unavailable
# http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html

STATUSCODE = 503

message = <<-HTML
            <h1>This Application Is Undergoing Maintenance</h1>
            Maintenance started @ #{STARTTIME}
          HTML

run lambda { |env| [ STATUSCODE, { "Content-Type" => "text/html" }, [ message ] ] }
