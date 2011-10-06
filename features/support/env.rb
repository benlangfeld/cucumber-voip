$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require 'cucumber-voip/cucumber'

include CucumberVoIP

RayoDriver.options =  {
                        :standard_caller_id   => 'sip:ben@langfeld.me',
                        :standard_dial_target => 'sip:usera@127.0.0.1',
                        # :jid                => 'userb@127.0.0.1',
                        # :password           => '1',
                        # :queue_timeout      => 30,
                        # :write_timeout      => 30,
                        # :log_file           => 'log/cucumber_voip.log'
                      }

class RayoDriver
  attr_accessor :script

  class << self
    def target_instance
      @@target_instance ||= new
    end
  end
end

RayoDriver.target_instance.instance_exec do
  self.options =  {
                    :jid                => 'usera@127.0.0.1',
                    # :password           => '1',
                    # :queue_timeout      => 30,
                    # :write_timeout      => 30,
                  }

  start

  Thread.new do
    while (call = @rayo.call_queue.pop)
      begin
        call.instance_eval script
      rescue => e
        puts "Exception in the call target script:"
        puts e.message
        puts e.backtrace.join("\n")
      end
    end
  end
end

RayoDriver.start
