module CucumberVoIP
  module API
    def start_rayo_driver
      RayoDriver.start
    end

    def cleanup_calls
      RayoDriver.cleanup_calls
    end

    def standard_caller_id
      RayoDriver.options[:standard_caller_id]
    end

    def standard_dial_target
      RayoDriver.options[:standard_dial_target]
    end

    def dial(options = {})
      RayoDriver.dial options
    end
  end
end
