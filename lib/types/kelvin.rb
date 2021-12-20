require_relative './temperature'
require_relative './celsius'

class Kelvin < Temperature
  def to_celsius
    (@value - 273.15).round(2)
  end

  def to_fahrenheit
    Celsius.new(to_celsius).to_fahrenheit
  end
end
