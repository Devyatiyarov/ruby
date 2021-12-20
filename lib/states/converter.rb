require_relative '../app_context'
require_relative '../types/celsius'
require_relative '../types/fahrenheit'
require_relative '../types/kelvin'
require_relative './output_result'

class Converter < State
  def convert
    value = @context.value
    from_type = @context.from_type
    case from_type
    when 'Kelvin'
      Kelvin.new value
    when 'Fahrenheit'
      Fahrenheit.new value
    when 'Celsius'
      Celsius.new value
    end
  end

  def render
    case @context.to_type
    when 'Kelvin'
      @value = convert.to_kelvin
    when 'Fahrenheit'
      @value = convert.to_fahrenheit
    when 'Celsius'
      @value = convert.to_celsius
    end
  end

  def next
    @context.transition_to OutputResult.new @value
  end
end
