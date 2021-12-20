require_relative './context'
require_relative './states/exit'

class AppContext < Context
  attr_accessor :value, :from_type, :to_type, :types

  def initialize(state)
    super(state)
    @value = nil
    @from_type = ''
    @to_type = ''
    @types = %w[Kelvin Fahrenheit Celsius]
  end
end
