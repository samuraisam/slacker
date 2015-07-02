require_relative '../plugin'

require_relative './graphite_api.rb'

require_relative './graph_view_plugin.rb'
require_relative './graph_search_plugin.rb'

module Slacker
  module Plugins
    class GraphiteEnsemble < Plugin
      def ready(robot, options = {})
        super(robot, options)
        host, port = ENV['GRAPHITE_API_HOST'], ENV['GRAPHITE_API_PORT']
        if (host && host.length > 0) and (port and port.length > 0)
          graphite_api = GraphiteAPI.new(host, port)

          robot.plug(GraphViewPlugin.new(graphite_api))
          robot.plug(GraphSearchPlugin.new(graphite_api))
        else
          @logger.warn "Graphite plugin not configured properly. Will not start."
        end
      end
    end
  end
end
