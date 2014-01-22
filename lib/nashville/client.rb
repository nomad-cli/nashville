require 'json'
require 'net/https'
require 'uri'

module Nashville
  ITUNES_SEARCH_ENDPOINT = "https://itunes.apple.com/search"

  class Client
    attr_accessor :search_url
    attr_accessor :country

    def initialize
      @search_url = ENV['ITUNES_SEARCH_ENDPOINT'] || ITUNES_SEARCH_ENDPOINT
      @country = 'US'
    end

    def search(params = {})
      params[:country] ||= @country

      uri = URI(@search_url)
      uri.query = URI.encode_www_form(params)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      request = Net::HTTP::Get.new(uri.request_uri)
      request['Accept'] = "application/json"

      response = http.request(request)
      json = JSON.parse(response.body)

      return json["results"]
    end
  end
end
