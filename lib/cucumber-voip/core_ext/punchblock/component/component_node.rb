module Punchblock
  module Component
    class ComponentNode
      attr_accessor :event_queue

      def initialize(*args)
        super
        @event_queue = Queue.new
        register_event_handler do |event|
          @event_queue << event
        end
      end

      def next_event(timeout = nil)
        Timeout::timeout(timeout) { event_queue.pop }
      end
    end
  end
end
