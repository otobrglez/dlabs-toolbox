require "pry"

module Toolbox
  class Fish
    Pry::Commands.create_command "duck", "D.Labs Duck", :shellwords => false do
      DUCK_METHODS = {
        tickets_find: "Find ticket.",
        find_tickets: "Find ticket (alias)."
      }

      def options(opt)
        opt.banner "Usage: duck <method> <option>\n\nMethods: #{DUCK_METHODS.keys.join(', ')}\n"
      end

      def process
        raise Pry::CommandError if args[0].nil?
        duck = Toolbox::Duck.new ENV["DLABS_EMAIL"], ENV["DLABS_PASS"]

        raise Pry::CommandError unless DUCK_METHODS.keys.include?(args[0].to_sym)

        if [:tickets_find, :find_tickets].include? args[0].to_sym
          out = duck.tickets_find :params => [args[1..args.size].join(" ")]
          out.each do |t|
            output.puts "#{t["rel_project"]}/#{("#"+t["id"].to_s).red} #{t["summary"]}"
          end
        end
      end
    end

    #Pry.config.prompt = proc { |obj, nest_level, _| "#{obj}:.#{nest_level}> " }
    Pry.config.prompt = proc { |obj, nest_level, _| "fish: " }
    Pry.start(TOPLEVEL_BINDING)
  end
end
