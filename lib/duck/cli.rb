require 'optparse'

module Duck

  class CLI
    def initialize
      options = {}
      optparse = OptionParser.new do |opts|
        opts.banner = "Usage: duck COMMAND [options]"
        opts.separator "Commands"
        opts.separator "\tprojects: List projects"
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

      # puts options.inspect
      # @api = API.new
      # puts ARGV.inspect

      @options = options
      @command = parse_command ARGV[0].to_s
    end

    def self.parse_command command
      case command
      when "projects"
        { command: :projects_fetch }
      when "a", "activities"
        { command: :activities_info}
      when "q", "quack"
        { command: :quack }
      else
        { command: :projects_fetch }
      end
    end

    def run
      api = Duck::API.new
      api.send(@command[:command].to_sym,@options)
    end
  end
end
