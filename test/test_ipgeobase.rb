# frozen_string_literal: true

require 'test_helper'

class TestIpgeobase < Minitest::Test
  def setup
    @ip_address = '185.13.177.9'

    stub_request(:get, "http://ip-api.com/xml/#{@ip_address}")
      .to_return(status: 200, body: load_fixture('xml_request.xml'), headers: {})
  end

  def test_that_it_has_a_version_number
    assert_equal ::Ipgeobase::VERSION, '0.1.0'
  end

  def test_it_ipgeobase_returns_correct_data
    result = Ipgeobase.lookup(@ip_address)
    assert { result.city.eql? 'Omsk' }
    assert { result.country.eql? 'Russia' }
    assert { result.countryCode.eql? 'RU' }
    assert { result.lat.eql? 54.9978 }
    assert { result.lon.eql? 73.4001 }
  end
end
