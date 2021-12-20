require_relative '../app_context'
require_relative './output_type'
require_relative './save'
require 'io/console'

class InputType < State
  attr_accessor :index

  def initialize(index = 0)
    super()
    @index = index
  end

  def max_index
    @context.types.size - 1
  end

  def key
    loop do
      user_input = $stdin.getch
      case user_input
      when "\r"
        return 'enter'
      when 'q'
        return 'q'
      when 'A'
        return 'up'
      when 'B'
        return 'down'
      end
    end
  end

  def render
    @k = key
    @index = [@index - 1, 0].max if @k == 'up'
    @index = [@index + 1, max_index].min if @k == 'down'
    exit if @k == 'q'
  end

  def next
    if @k == 'enter'
      @context.transition_to Save.new(@index)
    else
      @context.transition_to OutputType.new(@index)
    end
  end
end
