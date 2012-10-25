require "bundler/setup"
require "oj"
require "mechanize"
require "json"
require 'colorize'

class Duck
  def self.mechanize; @@mechanize ||= Mechanize.new end
  def self.credentials; @@credentials end
  def initialize(*credentials); @@credentials = credentials end

  def secure &block
    page = Duck.mechanize.get("https://duck.dlabs.si/auth/login") do |page|
      home = page.form_with(:action => "/auth/login") do |f|
        f.uid, f.pwd = Duck.credentials
      end.submit

      #TODO: Brake here if not logged in.
      return yield home if block_given?
    end
  end

  def method_missing method, *args, &block
    api(method, *args, &block) if method =~ /\_/
  end

  def api method, params=nil
    method = method.to_s.gsub! /\_/, "."
    secure do |home|
      xhr = {
        'X-Requested-With' => 'XMLHttpRequest',
        'Content-Type' =>'application/json; charset=utf-8',
        'Accept' => 'application/json, text/javascript, */*'
      }

      #TODO: What is :id?!
      opts = { :jsonrpc => "2.0", :method => method, :params => [], :id => 2
      }.merge!(params).to_json

      response = Duck.mechanize.post("https://duck.dlabs.si/api",opts,xhr)
      out = Oj.load(response.body)["result"]
    end
  end
end

d = Duck.new ENV["DLABS_EMAIL"], ENV["DLABS_PASS"]

res = d.tickets_find :params => [ARGV[0]]

puts res.map { |t| "#{t["id"].to_s.red}\t#{t["rel_project"]}\t\t#{t["summary"][0..20]}" }


