module CucumberVoIP
  module API
    def set_rayo_options(opts = {})
      RayoDriver.options = opts
    end

    def start_rayo_driver
      RayoDriver.start
    end

    def cleanup_calls
      RayoDriver.cleanup_calls
    end

    def dial(options = {})
      RayoDriver.dial options
    end
  end
end
