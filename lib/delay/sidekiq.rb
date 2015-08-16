
require 'sidekiq'

module Buzz
  module Delay
    class Sidekiq
      OPTIONS = { 'queue' => 'buzz', 'class' => Buzz::Delay::Sidekiq }.freeze

      def initialize(*args)
        @options = (opts = args.shift) ? OPTIONS.merge(opts) : OPTIONS
      end

      def call(payload)
        ::Sidekiq::Client.push @options.merge('args' => [payload])
      end

      include ::Sidekiq::Worker

      def perform(*args)
        Buzz.deliver(*args)
      end
    end
  end
end
