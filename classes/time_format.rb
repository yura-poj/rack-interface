require './modules/settings'

require 'date'
require 'byebug'
require 'rack'

class TimeFormat
  def initialize(quiry_string)
    @format_params = Rack::Utils.parse_nested_query(quiry_string)['format']
    @format_params = @format_params.nil? ? [] : @format_params.split(',')
  end

  def output
    return "Wrong params: #{wrong_params.join(', ')}" if wrong_params.any?

    time_in_format
  end

  def valid?
    wrong_params.empty?
  end

  private

  def time_in_format
    values = @format_params.map { |param| DateTime.now.send(param) }
    values.join('-')
  end

  def wrong_params
    @format_params.select { |param| !Settings::ALLOW_PARAMS.include? param }
  end
end
