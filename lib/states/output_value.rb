require_relative '../app_context'
require_relative './input_value'

class OutputValue < State
  def initialize(is_number: true)
    super()
    system 'clear'
    @is_number = is_number
  end

  def print_top
    print "Enter the #{@context.from_type} value\n"
  end

  def print_main
    print 'value: '
  end

  def print_botton
    print "\n\nthis is not a number"
  end

  def render
    print_top
    print_main
    print_botton unless @is_number
    print "\e[2;8H"
  end

  def next
    @context.transition_to InputValue.new
  end
end
