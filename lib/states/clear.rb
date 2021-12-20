require_relative '../app_context'

class Clear < State
  def render
    system 'clear'
    @context.value = nil
    @context.from_type = ''
    @context.to_type = ''
    @context.types = %w[Kelvin Fahrenheit Celsius]
  end

  def next
    @context.transition_to OutputType.new
  end
end
