require 'active_support/core_ext/string'
require 'errors/http/version'
require 'rack/utils'

module Errors
  class HTTP < StandardError
    def status
      :internal_server_error
    end

    def code
      Rack::Utils::SYMBOL_TO_STATUS_CODE[status]
    end
  end
end

Rack::Utils::SYMBOL_TO_STATUS_CODE.each do |status, code|
  Errors.const_set(status.to_s.camelize, Class.new(Errors::HTTP) do
    define_method(:status) do
      status
    end
  end) if (400...600).cover?(code)
end
