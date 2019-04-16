# frozen_string_literal: true

require 'api_tm4j_wrapper/version'

module ApiTm4jWrapper
  extend Configuration

  # Alias for ApiTm4jWrapper::Client.new
  #
  # @return [ApiTm4jWrapper::Client]
  def self.client(options = {})
    ApiTm4jWrapper::Client.new(options)
  end

  # Delegate to ApiTm4jWrapper::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to ApiTm4jWrapper::Client
  def self.respond_to?(method, include_all = false)
    client.respond_to?(method, include_all) || super
  end
end
