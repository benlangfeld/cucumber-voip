$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require 'cucumber-voip/cucumber'

CucumberVoIP::RayoDriver.options =  {
                                      :standard_caller_id   => 'sip:ben@langfeld.me',
                                      :standard_dial_target => 'sip:usera@127.0.0.1',
                                      # :jid                => 'userb@127.0.0.1',
                                      # :password           => '1',
                                      # :queue_timeout      => 30,
                                      # :write_timeout      => 30,
                                      # :log_file           => 'log/cucumber_voip.log'
                                    }
