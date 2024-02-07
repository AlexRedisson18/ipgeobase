# frozen_string_literal: true

require 'net/http'
require 'uri'

require_relative 'ipgeobase/version'
require_relative 'ipgeobase/metadata'

module Ipgeobase
  class Error < StandardError; end

  class << self
    def lookup(ip_address)
      response = Net::HTTP.get(URI("http://ip-api.com/xml/#{ip_address}"))
      Metadata.parse(response)
    end
  end
end
