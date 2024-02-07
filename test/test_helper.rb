# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'ipgeobase'

require 'minitest/autorun'
require 'minitest/power_assert'
require 'webmock/minitest'

def load_fixture(filename)
  File.read("test/fixtures/#{filename}")
end
