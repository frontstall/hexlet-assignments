# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
  def initialize(string)
    @url = URI(string)
  end

  attr_reader :url

  extend Forwardable
  include Comparable

  def_delegators :@url, :scheme, :host, :port, :to_s

  def query_params
    return {} if url.query.nil?

    url.query.split('&').each_with_object({}) do |pair, acc|
      key, value = pair.split('=')
      acc[key.to_sym] = value
    end
  end

  def query_param(key, default_value = nil)
    query_params[key] || default_value
  end

  def ==(other)
    [
      [other.query_params, query_params],
      [other.scheme, scheme],
      [other.host, host],
      [other.port, port]
    ].all? { |a, b| a == b }
  end
end
# END
