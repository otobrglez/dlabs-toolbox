require "bundler/setup"
require "oj"
require "mechanize"
require "json"
require 'colorize'

require_relative "toolbox/duck.rb"
require_relative "toolbox/fish.rb"

module Toolbox
end

#d = Toolbox::Duck.new ENV["DLABS_EMAIL"], ENV["DLABS_PASS"]

#res = d.tickets_find :params => [ARGV[0]]

#puts res.map { |t| "#{t["id"].to_s.red}\t#{t["rel_project"]}\t\t#{t["summary"][0..20]}" }


