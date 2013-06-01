require "client/version"
require 'rest-client'

module Client
  # Your code goes here...
  class ApiClient
    @base_url = 'http://www.example.com/'
    
    def self.fetch_root
      results = RestClient.get("#{@base_url}")
      json_results = JSON.parse(results)
    end
  end

end
