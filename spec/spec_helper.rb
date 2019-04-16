# frozen_string_literal: true

begin
  require 'simplecov'
rescue LoadError
  # ignore
else
  SimpleCov.start do
    add_group 'ApiTm4jWrapper', 'lib/api_tm4j_wrapper'
    add_group 'Faraday Middleware', 'lib/faraday'
    add_group 'Specs', 'spec'
  end
end

require_relative '../lib/api_tm4j_wrapper'
require 'faker'
require 'faker/medical'
require 'rspec'
require 'webmock/rspec'

# WebMock.disable!

RSpec.configure do |config|
  config.include WebMock::API
end

def capture_output
  begin
    old_stdout = $stdout
    $stdout = StringIO.new
    yield
    result = $stdout.string
  ensure
    $stdout = old_stdout
  end
  result
end

def a_delete(path_hash)
  a_request(:delete, format_full_url(path_hash))
end

def a_get(path_hash)
  a_request(:get, format_full_url(path_hash))
end

def a_post(path_hash)
  a_request(:post, format_full_url(path_hash))
end

def a_patch(path_hash)
  a_request(:patch, format_full_url(path_hash))
end

def a_put(path_hash)
  a_request(:put, format_full_url(path_hash))
end

def stub_delete(path_hash)
  stub_request(:delete, format_full_url(path_hash))
end

def stub_get(path_hash)
  stub_request(:get, format_full_url(path_hash))
end

def stub_post(path_hash)
  stub_request(:post, format_full_url(path_hash))
end

def stub_put(path_hash)
  stub_request(:put, format_full_url(path_hash))
end

def stub_patch(path_hash)
  stub_request(:patch, format_full_url(path_hash))
end

def fixture_path
  File.expand_path('../fixtures', __dir__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def format_full_url(path_hash)
  ApiTm4jWrapper.send(path_hash.keys.first) + path_hash.values.first
end
