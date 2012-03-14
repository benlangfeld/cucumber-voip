%w{
  punchblock
  rspec-rayo
  active_support/core_ext/module/delegation

  cucumber-voip/core_ext/punchblock/component/component_node
}.each { |f| require f }

module CucumberVoIP
  class RayoDriver
    attr_reader :options

    delegate :cleanup_calls, :dial, :to => :@rayo

    class << self
      def tester_instance
        @@tester_instance ||= new
      end

      def method_missing(method_name, *args, &block)
        if tester_instance.respond_to? method_name
          tester_instance.send method_name, *args, &block
        else
          super
        end
      end

      def respond_to?(method_name)
        super || tester_instance.respond_to?(method_name)
      end
    end

    def initialize
      @options = {
                    :jid            => 'userb@127.0.0.1',
                    :password       => '1',
                    :host           => '127.0.0.1',
                    :queue_timeout  => 30,
                    :write_timeout  => 30
                  }
    end

    def options=(other)
      options.merge! other
    end

    def start
      raise StandardError, 'You cannot start the Rayo driver more than once!' if @rayo
      @rayo = RSpecRayo::RayoDriver.new :username       => options[:jid],
                                        :password       => options[:password],
                                        :host           => options[:host],
                                        :port           => options[:port],
                                        :queue_timeout  => options[:queue_timeout],
                                        :write_timeout  => options[:write_timeout]
      begin
        @rayo.wait_for_connection 10
      rescue Timeout::Error
        abort 'Could not connect to Rayo Server. Aborting!'
      end
    end

    private

    def logger
      @logger ||= Logger.new options[:log_file]
    end
  end
end
