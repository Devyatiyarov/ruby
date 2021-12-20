require_relative '../app_context'
require_relative './output_type'
require_relative './output_value'
require_relative './input_value'
require_relative './converter'

class Save < State
  def initialize(value)
    super()
    @value = value
  end

  def save_to_type
    @context.to_type = @context.types[@value]
    @context.types.delete(@context.to_type)
  end

  def save_from_type
    @context.from_type = @context.types[@value]
    @context.types.delete(@context.from_type)
  end

  def render
    system 'clear'
  end

  def next
    if @context.from_type == ''
      save_from_type
      @context.transition_to OutputType.new
    elsif @context.to_type == ''
      save_to_type
      @context.transition_to OutputValue.new
    else
      @context.value = @value
      @context.transition_to Converter.new
    end
  end
end
