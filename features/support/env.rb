$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require 'cucumber-voip/cucumber'

CucumberVoIP::RayoDriver.options =  {
                                      # :jid            => 'userb@127.0.0.1',
                                      # :password       => '1',
                                      # :queue_timeout  => 30,
                                      # :write_timeout  => 30,
                                      # :log_file       => 'log/cucumber_voip.log'
                                    }
