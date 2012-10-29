require 'optparse'

module Duck

  class CLI
    def initialize
      options = {}
      optparse = OptionParser.new do |opts|
        opts.banner = "Usage: duck COMMAND [options]"
        opts.separator "Commands"
        opts.separator "\ta: Finding activities"
        opts.separator "\tq: Quack tool"
        opts.separator "Options"

        opts.on("-a", "--activity ID", String, "Activity ID" ) do |a|
          options[:activity] = a
        end

        opts.on("-p", "--project ID", String, "Project ID") do |p|
          options[:project] = p
        end
      end

      optparse.parse!

      puts options.inspect

      # @api = API.new

      puts ARGV.inspect
    end
  end
end
