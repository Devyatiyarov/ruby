require_relative './temperature'

class Celsius < Temperature
  def to_fahrenheit
    ((@value * 9.0 / 5.0) + 32.0).round(2)
  end

  def to_kelvin
    (@value + 273.15).round(2)
  end
end
