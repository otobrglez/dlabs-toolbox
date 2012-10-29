require 'json'
require 'oj'
require 'net/http'
require 'uri'
require 'httparty'
require 'pathname'

module Duck
  class NonRestApi
    include HTTParty
    base_uri 'https://duck.dlabs.si/'
    no_follow true

    def auth credentials
      self.class.post('/auth/login', :query => {
        "uid" => credentials[0], "pwd" => credentials[1]
      })
    end
  end

  class API
    include HTTParty
    base_uri 'https://duck.dlabs.si/api'
    # debug_output $stderr

    def credentials
      return @credentials unless @credentials.nil?

      # Use ENV if set
      if not(ENV["DLABS_EMAIL"].nil?) and not(ENV["DLABS_PASS"].nil?)
        @credentials = [ENV["DLABS_EMAIL"], ENV["DLABS_PASS"]]
      end

      # If still not set try to read ~/.dlabs-credentials
      if @credentials.nil? or @credentials.empty?
        path = File.join Dir.home, ".dlabs-credentials"
        if File.exists? path
          @credentials = Oj.load_file(path).values rescue []
        end
      end

      # Break if still not present
      if @credentials.nil? or @credentials.empty?
        throw 'Please create file "~.dlabs-credentials" with your credentials!'
      end

      @credentials
    end

    # Get DuckSID
    def duck_sid
      if @duck_sid.nil?
        begin
          response = NonRestApi.new.auth(credentials)
        rescue HTTParty::RedirectionTooDeep => e # SAD! But true :|
          @duck_sid = e.response.get_fields('Set-Cookie')[1].match(/\w{32}+/).to_s rescue nil
        end
      end
      @duck_sid
    end

    def call_with_post method, params=[], id=nil
      in_params = {
        "jsonrpc"=> "2.0",
        "method"=> method,
        "params"=> params,
        "id"=> id.nil? ? rand(1000) : id
      }

      self.class.cookies({"DuckSID"=> duck_sid})
      result = self.class.post('/',{
        :headers => {"X-Requested-With" => "XMLHttpRequest"},
        :body => in_params.to_json
      })

      parsed = result.parsed_response
      return parsed["result"] unless parsed["result"].nil?
      parsed["error"]
    end

    def activities_info params=[]
      call_with_post "activities.info", params
    end

    def tickets_find params=[]
      call_with_post "tickets.find", params
    end

    def calendar_months params=[]
      call_with_post "calendar.months", params
    end

  end
end
