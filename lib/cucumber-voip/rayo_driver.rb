%w{
  punchblock
  rspec-rayo
  active_support/core_ext/module/delegation
}.each { |f| require f }

module CucumberVoIP
  class RayoDriver
    @@tester_instance = nil
    @@target_instance = nil

    attr_reader :options

    delegate :cleanup_calls, :dial, :to => :@rayo

    class << self
      def tester_instance
        @@tester_instance ||= new
      end

      def target_instance
        @@target_instance ||= new
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
                    :write_timeout  => 30,
                    :log_file       => 'log/cucumber_voip.log'
                  }
    end

    def options=(other)
      options.merge! other
    end

    def start
      raise StandardError, 'You cannot start the Rayo driver more than once!' if @rayo
      @rayo = RSpecRayo::RayoDriver.new :username         => options[:jid],
                                        :password         => options[:password],
                                        :host             => options[:host],
                                        :port             => options[:port],
                                        :wire_logger      => logger,
                                        :transport_logger => logger,
                                        :log_level        => Logger::DEBUG,
                                        :queue_timeout    => options[:queue_timeout],
                                        :write_timeout    => options[:write_timeout]
      status = @rayo.read_queue @rayo.event_queue
      raise StandardError, 'Could not connect to Prism XMPP Server. Aborting!' unless status == 'CONNECTED'
      @rayo.start_event_dispatcher
    end

    private

    def logger
      @logger ||= Logger.new options[:log_file]
    end
  end
end
