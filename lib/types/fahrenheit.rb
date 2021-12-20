require_relative './temperature'
require_relative './celsius'

class Fahrenheit < Temperature
  def to_celsius
    ((@value - 32.0) * (5.0 / 9.0)).round(2)
  end

  def to_kelvin
    Celsius.new(to_celsius).to_kelvin
  end
end
