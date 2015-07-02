require 'logging'

module Slacker
  module Plugins
    class Plugin
      # Public - called when the plugin is ready to be attached
      # to the robot
      #
      # Returns nothing
      def ready(robot, options = {})
        @logger = options[:logger] || Logger.new(STDERR)
      end
    end
  end
end
